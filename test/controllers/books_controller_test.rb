require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  # INDEX
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  # NEW
  test "should get new form" do
    get :new
    assert_response :success
    assert_template partial: '_form'
    assert_template :new
  end

  # CREATE
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

  # SHOW
  test "should show the requested book" do
    book = books(:HP_seven).id
    get :show, { id: book }
    assert_response :success
    assert_template :show
    yolo = assigns(:book)
    assert_not_nil yolo
    assert_equal yolo.id, book
  end

  # EDIT
  test "should get edit form" do
    id = books(:HP_six).id
    get :edit, { id: id }
    assert_response :success
    assert_template :edit
  end

  # UPDATE
  test "should update the book" do
    id = books(:HP_two).id
    patch :update, {id: id, book: {name: "HP_two"} }
    assert_equal "HP_two", Book.find(id).name
    assert_redirected_to books_path
  end

  test "update should not allow nil author" do
       id = books(:HP_three).id
       patch :update, {id: id, book: {author: nil} }
       assert_equal "J.K. Rowling", Book.find(id).author
       assert_template :edit
     end

end
