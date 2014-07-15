class VideosController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_video, only: [:show, :edit, :edit_tags, :update, :update_tags]
  before_action :correct_user, only: :edit

  def index
    @videos = Video.includes(:tags).page params[:page]
  end

  def tag
    @tag_name = params[:tag]
    @tag = ActsAsTaggableOn::Tag.find_by_name(@tag_name)
    @videos = Video.includes(:tags).tagged_with(@tag).page params[:page]
  end

  def edit_tags
  end

  def update_tags
    add_user_as_tagger
    @video = Video.friendly.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @video, notice: "Your tag list was updated." }
      format.js
    end
  end

  def show
    @related_videos = @video.find_related_tags.take(3)
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)

    if @video.save
      add_user_as_tagger
      respond_to do |format|
        format.html { redirect_to @video, notice: 'Your video was created.' }
        format.js
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      add_user_as_tagger
      redirect_to @video, notice: 'Your video was updated.'
    else
      render :edit
    end
  end

  private

  def find_video
    @video = Video.friendly.includes(:tags).find(params[:id])
  end

  def correct_user
    redirect_to root_url, notice: 'You can only edit a video that you have uploaded.' unless current_user?(@video.user)
  end

  def add_user_as_tagger
    current_user.tag(@video, with: params[:user_tags], on: :tags)
  end

  def video_params
    params.require(:video).permit(:title, :creator, :year_created,
                                  :description, :link, :url, :tag_list,
                                  :user_id)
  end
end
