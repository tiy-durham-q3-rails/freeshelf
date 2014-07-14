require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    login
    @video = videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video" do
    assert_difference('Video.count') do
      post :create, video: { creator: @video.creator, url: @video.url, description: @video.description, title: @video.title }
    end

    assert_redirected_to video_path(assigns(:video))
  end

  test "should show video" do
    get :show, id: @video
    assert_response :success
  end

  test "should update video" do
    patch :update, id: @video, video: { creator: @video.creator, url: @video.url, description: @video.description, title: @video.title }
    assert_redirected_to video_path(assigns(:video))
  end
end
