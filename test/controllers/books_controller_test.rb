require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @user = login
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
    get :index, :tag => "world"
    assert_response :success
    deny { assigns(:books).nil? }
    deny { assigns(:books).empty? }
  end

  test "tags should work on a tag that does not exist" do
    get :index, :tag => "no-go"
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

  test "should get edit if book was created by current_user" do
    @book.update(user: @user)
    get :edit, id: @book
    assert_response :success
  end

  test "should get redirected from edit if book was not created by current_user" do
    get :edit, id: @book
    assert_response :redirect
  end

  test "should update book" do
    patch :update, id: @book, book: { creator: @book.creator, url: @book.url, description: @book.description, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

end
