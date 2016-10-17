require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
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
  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end
  #
  # test "should get delete" do
  #   get :delete
  #   assert_response :success
  # end
  #
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

end
