require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "index should show all the books" do
      get :index
      assert_response :success
      assert_template :index
    end

    test "new should get the new form for a new book" do
      get :new
      assert_response :success
      assert_template :new

      book = assigns(:book)
      assert_not_nil book
      assert_nil book.id
    end

    test "add a new book to the DB" do
      post_params = { book: { title: "New Book",
								 author: "Allison" } }
      assert_difference('Book.count', 1) do
        post :create, post_params
      end

      book = assigns(:book)
      assert_redirected_to book_path(book)
    end

    test "doesn't add an invalid book to the DB" do
      post_params = { book: { author: "Allison" } }
      assert_no_difference('Book.count') do
        post :create, post_params
      end

      assert_template :new
    end
end
