require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "a book generates a slug from its title" do
    book = Book.new(:title => "There and Back Again", :creator => "Bilbo Baggins")
    book.valid?
    assert { book.slug == "there-and-back-again" }
  end

  test "a book generates a slug from its title and author if the title is not unique" do
    Book.new(:title => "There and Back Again", :creator => "Bilbo Baggins", :url => "http://example.org").save!
    book = Book.new(:title => "There and Back Again", :creator => "Pat Murphy")
    book.valid?
    assert { book.slug == "there-and-back-again-pat-murphy" }
  end
end
