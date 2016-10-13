require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: books(:one).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, {book: {title: "Homeless Bird", author: "Gloria Whelan", synopsis: "Wonderful"}}
    assert_response :redirect
  end

  test "creating a book changes the number of books" do
    assert_difference("Book.count", 1) do
      post :create, {book: {title: "Homeless Bird", author: "Gloria Whelan", synopsis: "Wonderful"}}
      assert_response :redirect
    end
  end

  test "should get edit" do
    get :edit, {id: books(:one).id}
    assert_response :success
  end

  test "should get update" do
    patch :update, {id: books(:one).id, book: {title: "Homeless Bird", author: "Gloria Whelan", synopsis: "Wonderful"}}
    assert_response :redirect
  end
  #
  # test "should upvote" do
  #   patch :upvote
  #   assert_response :success
  # end
  #
  test "should get destroy" do
    delete :destroy, {id: books(:one).id}
    assert_response :redirect
  end

  test "deleting a book changes the number of books" do
    assert_difference("Book.count", -1) do
      delete :destroy, {id: books(:one).id}
      assert_response :redirect
    end
  end

end
