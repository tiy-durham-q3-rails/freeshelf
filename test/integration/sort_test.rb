require 'test_helper'

class SortTest < ActionDispatch::IntegrationTest
  test "dropdown shows sort links" do
    use_driver(:selenium)
    user = login
    visit books_path
    assert { page.has_selector? "a.sort_dropdown" }
    assert { page.has_no_selector? "li.sort_link" }
    find("a.sort_dropdown").click
    assert { page.has_selector? "li.sort_link"}
    assert { page.has_selector? "li#alpha_sort"}
    assert { page.has_selector? "li#added_sort"}
    assert { page.has_selector? "li#publi_sort"}
    assert { page.has_selector? "li#favor_sort"}
  end

  test "books can be sorted alphabetically" do
    use_driver(:selenium)
    user = login
    visit books_path
    find("a.sort_dropdown").click
    within("li#alpha_sort") do
      find("a.sort_by").click
    end
    alpha_titles = page.all('.title')
    assert_equal "AMyString", alpha_titles[0].text
    assert_equal "BMyString", alpha_titles[1].text
    assert_equal "CMyString", alpha_titles[2].text
  end

  test "books can be sorted by date added" do
    use_driver(:selenium)
    user = login
    visit books_path
    find("a.sort_dropdown").click
    within("li#publi_sort") do
      find("a.sort_by").click
    end
    publi_years = page.all('.publish-year')
    assert_equal "2014", publi_years[0].text
    assert_equal "2001", publi_years[1].text
    assert_equal "1995", publi_years[2].text
  end
end
