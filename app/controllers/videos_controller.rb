class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all.includes(:tags).page params[:page]
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

  def edit
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :contributor, :summary, :link, :tag_list)
  end
end
