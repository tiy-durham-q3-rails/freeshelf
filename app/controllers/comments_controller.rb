class CommentsController < ApplicationController
  def create
    if current_user
      if params[:book_id]
        @book = Book.friendly.find(params[:book_id])
        @comment = @book.comments.create(comment_params)
        redirect_to book_path(@book)
      else
        @video = Video.friendly.find(params[:video_id])
        @comment = @video.comments.create(comment_params)
        redirect_to video_path(@video)
      end
    else
      if params[:book_id]
        redirect_to book_url(params[:book_id]), notice: 'You need to be logged in to comment.'
      else
        redirect_to video_url(params[:video_id]), notice: 'You need to be logged in to comment.'
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end


end
