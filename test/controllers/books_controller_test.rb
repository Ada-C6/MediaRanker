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


end
