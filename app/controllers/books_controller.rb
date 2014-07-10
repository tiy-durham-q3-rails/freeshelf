class BooksController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_book, only: [:show, :edit, :edit_tags, :update, :update_tags]
  before_action :correct_user, only: :edit

  def index
    @books = Book.includes(:tags).page params[:page]
  end

  def tags
    @tag_name = params[:tag]
    @tag = ActsAsTaggableOn::Tag.find_by_name(@tag_name)
    @books = Book.includes(:tags).tagged_with(@tag).page params[:page]
  end

  def edit_tags
  end

  def update_tags
    if @book.update(params.require(:book).permit(:tag_list))
      redirect_to @book, notice: "Your tag list was updated."
    else
      render :edit_tags
    end
  end

  def show
    @related_books = @book.find_related_tags.take(3)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
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

  private

  def find_book
    @book = Book.includes(:tags).find(params[:id])
  end

  def correct_user
    @user = Book.find(params[:id]).user
    redirect_to root_url, notice: 'You can only edit a book that you have uploaded.' unless current_user?(@user)
  end

  def book_params
    params.require(:book).permit(:title, :url, :publish_year, :author, :description, :cover, :cover_cache,
                                 :remote_cover_url, :document, :tag_list, :user_id)
  end
end
