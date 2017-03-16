require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: books(:one).id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: books(:one).id}
    assert_response :success
  end

  test "should be able to create" do
    post_params = { book: {name: "book3", description: "a book suggestion", genre: "fiction"} }
    post :create, post_params
    assert_response :redirect
  end

  test "creating a new book changes the number of books" do
    assert_difference("Book.count", 1) do
      post_params = { book: {name: "another book", description: "a book suggestion", genre: "romance"} }
      post :create, post_params
    end
  end

  test "should be able to update a book" do
    patch :update, :id => books(:one), :book => {description: "a book suggestion"}
    assert_equal "a book suggestion", assigns(:book).description
    assert_response :success
  end

  test "should be able to delete" do
    delete :destroy, {id: books(:one).id}
    assert_response :redirect
  end

  test "should be able to delete book1" do
    assert_difference("Book.count", -1) do
      delete :destroy, { id: books(:one).id }
    end
  end

end
