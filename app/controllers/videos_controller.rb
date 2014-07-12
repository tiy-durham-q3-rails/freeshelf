class VideosController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_video, only: [:show, :edit, :update]

  def index
    @videos = Video.includes(:tags).page params[:page]
  end

  def tag
    @tag_name = params[:tag]
    @tag = ActsAsTaggableOn::Tag.find_by_name(@tag_name)
    @videos = Video.includes(:tags).tagged_with(@tag).page params[:page]
  end

  def show
    @related_videos = @video.find_related_tags.take(3)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video, notice: 'Your video was created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Your video was updated.'
    else
      render :edit
    end
  end

  private

  def find_video
    @video = Video.friendly.includes(:tags).find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :contributor, :summary, :link, :tag_list)
  end
end
