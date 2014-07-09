class BooksController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_book, only: [:show, :edit, :update]

  def index
    @books = Book.includes(:tags)
  end

  def tags
    @tag = params[:tag]
    @books = Book.tagged_with(@tag).includes(:tags)
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
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :url, :publish_year, :author, :description, :cover, :cover_cache,
                                 :remote_cover_url, :document, :tag_list)
  end
end
