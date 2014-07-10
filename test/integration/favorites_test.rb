require 'test_helper'

class FavoritesTest < ActionDispatch::IntegrationTest
  test "user can favorite a book" do
    use_driver(:webkit)
    user = login
    visit book_path(books(:one))
    assert { page.has_selector? "a.favorite i" }
    assert { page.has_no_selector? "a.favorite i.favorited" }
    find("a.favorite").click
    assert { page.has_selector? "a.favorite i.favorited" }
  end
end
