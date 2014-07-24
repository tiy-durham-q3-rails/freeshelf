class BooksController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :edit_tags, :update, :update_tags]
  before_action :find_book, only: [:show, :edit, :edit_tags, :update, :update_tags]
  before_action :find_books, only: [:index]
  before_action :correct_user, only: :edit

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_tags
  end

  def update_tags
    add_user_as_tagger
    @book = Book.friendly.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @book, notice: "Your tag list was updated." }
      format.js
    end
  end

  def show
    @related_books = @book.find_related_tags.take(3)
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      add_user_as_tagger
      email_update(@book)
      respond_to do |format|
        format.html { redirect_to @book, notice: "Your book was added." }
        format.js
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      add_user_as_tagger
      redirect_to @book, notice: "Your book was updated."
    else
      render :edit
    end
  end

  def email_update(book)
    tags = book.tags
    slug = book.slug
    recipients = User.where(email_update:true).all
    recipients.each do |user|
      favs = user.favorite_tags
      tags.each do |tag|
        favs.each do |fav|
          if fav.id == tag.id
            TagMailer.new_tag_alert(user, slug, tag).deliver
            end
          end
        end
      end
  end

  private

  def find_book
    @book = Book.friendly.includes(:tags).find(params[:id])
  end

  def find_books
    @books = Book.sort_by(params).includes(:tags)
    if params[:tag].present?
      @tag = ActsAsTaggableOn::Tag.where(name: params[:tag]).first_or_create
      @books = @books.tagged_with(@tag)
    end
    @books = @books.page params[:page]
  end

  def correct_user
    redirect_to root_url, notice: 'You can only edit a book that you have uploaded.' unless current_user?(@book.user)
  end

  def add_user_as_tagger
    current_user.tag(@book, with: params[:user_tags], on: :tags)
  end

  def book_params
    params.require(:book).permit(:title, :url, :year_created, :creator, :description, :cover, :cover_cache,
                                 :remote_cover_url, :document, :tag_list, :user_id)
  end
end
