require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "show the requested book" do
    book_id = books(:americanah).id
    get :show, { id: book_id }
    assert_response :success
    assert_template :show

    book = assigns(:book)
    assert_not_nil book
    assert_equal book.id, book_id
  end
end
