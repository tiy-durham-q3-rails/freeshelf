require 'test_helper'
require 'headless'

class SortTest < ActionDispatch::IntegrationTest
  def setup
    use_driver(:selenium)
  end

  # test "dropdown shows sort links" do
  #   user = login
  #   visit books_path
  #   assert { page.has_selector? "a.sort_dropdown" }
  #   assert { page.has_no_selector? "li.sort_link" }
  #   find("a.sort_dropdown").click
  #   assert { page.has_selector? "li.sort_link"}
  #   assert { page.has_selector? "a#alphabetically"}
  #   assert { page.has_selector? "a#date_added"}
  #   assert { page.has_selector? "a#year_published"}
  #   assert { page.has_selector? "a#most_popular"}
  #   assert { page.has_no_selector? "a.reverse_order"}
  #   find("a#alphabetically").click
  #   assert { page.has_selector? "a.reverse_order"}
  # end
  #
  # test "books can be sorted alphabetically" do
  #   user = login
  #   visit books_path
  #   find("a.sort_dropdown").click
  #   find("#alphabetically").click
  #   alpha_titles = page.all('.title')
  #   assert_equal "AMyString", alpha_titles[0].text
  #   assert_equal "BMyString", alpha_titles[1].text
  #   assert_equal "CMyString", alpha_titles[2].text
  #   find("a.reverse_order").click
  #   alpha_titles = page.all('.title')
  #   assert_equal "EMyString", alpha_titles[0].text
  #   assert_equal "DMyString", alpha_titles[1].text
  #   assert_equal "CMyString", alpha_titles[2].text
  # end
  #
  # test "books can be sorted by date added" do
  #   user = login
  #   visit books_path
  #   find("a.sort_dropdown").click
  #   find("a#year_published").click
  #   publi_years = page.all('.year-created')
  #   assert_equal "2014", publi_years[0].text
  #   assert_equal "2001", publi_years[1].text
  #   assert_equal "1995", publi_years[2].text
  #   find("a.reverse_order").click
  #   publi_years = page.all('.year-created')
  #   assert_equal "1970", publi_years[0].text
  #   assert_equal "1990", publi_years[1].text
  #   assert_equal "1995", publi_years[2].text
  # end
end
