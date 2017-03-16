require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should show list of books" do
    get :index
    assert_response :success
  end

  test "should show specified book" do
    get :show, {id: books(:rainbow).id}
    assert_response :success
  end

  test "should show form to add book" do
    get :new
    assert_response :success
  end

  test "should create new book" do
    post :create, {book: {name: "Wow"}}
    assert_response :redirect
  end

  test "should show form to edit specified book" do
    get :edit, {id: books(:rainbow).id}
    assert_response :success
  end

  test "should update book" do
    put :update, {id: books(:rainbow).id}
    assert_response :redirect
  end

  test "should delete book" do
    delete :destroy, {id: books(:rainbow).id}
    assert_response :redirect
  end

end
