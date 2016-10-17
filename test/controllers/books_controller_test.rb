require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get the edit form for an existing book to edit" do
    get :edit, { id: books(:first_book).id }
    assert_response :success
    assert_template :edit
  end

  test "should create a new book" do
    book_params = { book: { name: "Classics", author: "Many", description: "Many clasics", ranking: 5 }}
    post :create, book_params
    assert_redirected_to books_path
  end

  test "load show with given book id" do
    get :show, { id: books(:first_book).id }
    assert_response :success
    assert_template :show
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "can create a book" do
    get :new
    assert_response :success

    book_params = { book: { name: "can create", author: "article", description: "successfully.", ranking: 12 } }
    post :create, book_params
    assert_response :redirect
    # follow_redirect
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
  end
end
