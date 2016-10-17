require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get new form" do
    get :new
    assert_response :success
    assert_template partial: '_form'
    assert_template :new
  end

  test "add a new book" do
     post_params = {book: {name: "Yolo", author: "Tina Fey"} }
     assert_difference("Book.count", 1) do
       post :create, post_params
     end
     assert_redirected_to books_path
   end

  test "won't add an invalid book" do
    post_params = { book: { author: "Yolo" } }
    assert_no_difference('Book.count') do
      post :create, post_params
    end
    assert_template :new
  end

  test "should show the requested book" do
    book = books(:HP_seven).id
    get :show, { id: book }
    assert_response :success
    assert_template :show
    yolo = assigns(:book)
    assert_not_nil yolo
    assert_equal yolo.id, book
  end

  test "should get edit form" do
    id = books(:HP_six).id
    get :edit, { id: id }
    assert_response :success
    assert_template :edit
  end

end
