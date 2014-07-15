class API::V1::BooksController < API::BaseController
  respond_to :json

  before_action :authorize, only: [:new, :create, :edit, :update]
  before_action :find_book, only: [:show, :edit, :update]
  before_action :correct_user, only: :edit

  def index
    @books = Book.includes(:tags).page params[:page]
  end

  def show
    @related_books = @book.find_related_tags.take(3)
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      add_user_as_tagger
      email_update(@book)
      render "show", :status => :created
    else
      render "create", :status => :bad_request
    end
  end

  def update
    if @book.update(book_params)
      add_user_as_tagger
      render "show"
    else
      render "create", :status => :bad_request
    end
  end

  private

  def find_book
    @book = Book.friendly.includes(:tags).find(params[:id])
  end

  def correct_user
    render :nothing => true, :status => :unauthorized unless current_user?(@book.user)
  end

  def add_user_as_tagger
    current_user.tag(@book, with: params[:user_tags], on: :tags)
  end

  def book_params
    params.require(:book).permit(:title, :url, :year_created, :creator, :description, :cover, :cover_cache,
                                 :remote_cover_url, :document, :tag_list, :user_id)
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
end
