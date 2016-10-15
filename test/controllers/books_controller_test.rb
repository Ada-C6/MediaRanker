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

end
