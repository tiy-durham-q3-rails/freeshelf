require 'test_helper'

class FavoritesTest < ActionDispatch::IntegrationTest
  def setup
    use_javascript
    @user = login
    super
  end

  test "user can favorite a book" do
    visit book_path(books(:one))
    assert { page.has_selector? "a.favorite i" }
    assert { page.has_no_selector? "a.favorite i.favorited" }
    find("a.favorite").click
    assert { page.has_selector? "a.favorite i.favorited" }
  end

  test "user can favorite a video" do
    visit video_path(videos(:one))
    assert { page.has_selector? "a.favorite i" }
    assert { page.has_no_selector? "a.favorite i.favorited" }
    find("a.favorite").click
    assert { page.has_selector? "a.favorite i.favorited" }
  end

end
