require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get the new partial form for adding a book" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: '_form'

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end
  test "add a new book to the database (create action)" do
    assert_difference('Book.count', 1) do
      post_params = { book: { name: "Why Iris is Awesome" } }
      post :create, post_params
    end

    assert_redirected_to book_path(Book.last)
  end

  test "should show the requested book" do
    get :show, { id: books(:three).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:book), books(:three)
  end
end
