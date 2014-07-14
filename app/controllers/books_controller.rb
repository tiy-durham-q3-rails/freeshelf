class BooksController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_book, only: [:show, :edit, :update]

  def index
    @books = Book.includes(:tags).page params[:page]
  end

  def tags
    @tag_name = params[:tag]
    @tag = ActsAsTaggableOn::Tag.where(:name => @tag_name).first_or_create
    @books = Book.includes(:tags).tagged_with(@tag).page params[:page]
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      email_update(@book)
      # TagMailer.new_tag_alert(current_user, @book.slug, @book.tag_list).deliver

      redirect_to @book, notice: "Your book was added."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
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




  def book_params
    params.require(:book).permit(:title, :url, :year_created, :creator, :description,
                                 :cover, :cover_cache, :remote_cover_url, :tag_list)
  end
end
