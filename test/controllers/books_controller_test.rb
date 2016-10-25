require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: books(:one)}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create object" do
    params = {book: {name: "harry potter"}}
    post :create, params
    assert_response :redirect
  end

  test "should create an object and increase count" do
    assert_difference("Book.count", 1) do
      params = {book: {name: "pajama time"}}
      post :create, params
    end
  end

  test "should get edit" do
    get :edit, {id: books(:one)}
    assert_response :success
  end

  test "should update object" do
    patch :update, {id: books(:one), book: {name: "pooh bear"}}
    assert_equal Book.find(books(:one).id).name, "pooh bear"
    assert_response :redirect
  end

  test "should delete object" do
    assert_difference("Book.count", -1) do
      delete :destroy, {id: books(:one)}
      assert_response :redirect
    end
  end

end
