
require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  def setup
    login users(:one)
  end

  test "create can make a new favorite book" do
    post :create, :format => "js",
                  :favorite => {:favoritable_id => books(:one).id,
                                :favoritable_type => "Book"}
    assert_response :created
    assert_includes users(:one).favorite_books, books(:one)
  end

  test "create can make a new favorite tag" do
    post :create, :format => "js",
                  :favorite => {:favoritable_id => tags(:js).id,
                                :favoritable_type => "ActsAsTaggableOn::Tag"}
    assert_response :created
    assert_includes users(:one).favorite_tags, tags(:js)
  end
end
