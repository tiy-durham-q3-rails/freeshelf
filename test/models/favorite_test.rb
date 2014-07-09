require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  def setup
    users(:one).favorites.create(favoritable: books(:one))
    users(:one).favorites.create(favoritable: tags(:ruby))
  end

  test "a user can have favorites" do
    assert_equal 2, users(:one).favorites.size
  end

  test "a user can have favorite books" do
    assert_equal 1, users(:one).favorite_books.size
    assert_includes users(:one).favorite_books, books(:one)
  end

  test "a user can have favorite tags" do
    assert_equal 1, users(:one).favorite_tags.size
    assert_includes users(:one).favorite_tags, tags(:ruby)
  end
end
