require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    login
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    deny { assigns(:books).nil? }
    deny { assigns(:books).empty? }
  end

  test "should get tags" do
    @book.tag_list = "hello, world, test"
    @book.save!
    get :tags, :tag => "world"
    assert_response :success
    deny { assigns(:books).nil? }
    deny { assigns(:books).empty? }
  end

  test "tags should work on a tag that does not exist" do
    get :tags, :tag => "no-go"
    assert_response :success
    deny { assigns(:books).nil? }
    assert { assigns(:books).empty? }
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { creator: @book.creator, url: @book.url, description: @book.description, title: @book.title }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { creator: @book.creator, url: @book.url, description: @book.description, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

end
