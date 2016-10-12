require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show book" do
    get :show, {id: books(:red_fern).id}
    assert_response :success
    assert_template :show
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should be able to create a new book" do
    post_params = {book: {title: "Harry Potter", author: "JK Rowling", genre: "Fantasy", description: "You're a wizard harry!", rank: 4090094383}}
    post :create, post_params
    assert_redirected_to controller: "books", action: "index"
  end

  test "creating a book changes the number of books" do
    assert_difference("Book.count",1) do
      post_params = {book: {title: "Harry Potter", author: "JK Rowling", genre: "Fantasy", description: "You're a wizard harry!", rank: 4090094383}}
      post :create, post_params
    end
  end

  test "should get edit" do
    get :edit, {id: books(:red_fern).id}
    assert_response :success
  end

  test "should be able to update a book" do
    put :update, {id: books(:red_fern).id, book: {title: "Harry Potter", author: "JK Rowling", genre: "Fantasy", description: "You're a wizard harry!", rank: 4090094383}}
    assert_redirected_to controller: "books", action: "show"
  end

  test "should be able to upvote a book" do
    patch :upvote, {id: books(:red_fern).id}
    assert_redirected_to controller: "books", action: "show"
  end
  test "should be able to downvote a book" do
    patch :downvote, {id: books(:red_fern).id}
    assert_redirected_to controller: "books", action: "show"
  end

  test "should be able to delete a book" do
    delete :destroy, {id: books(:red_fern).id}
    assert_redirected_to controller: "books", action: "index"
  end

  test "deleting a book changes the number of books" do
    assert_difference("Book.count", -1) do
      delete :destroy, {id: books(:red_fern).id }
    end
  end

  test "responds with error if file isn't found" do
    delete :destroy, {id: 1000}
    assert_response :missing
  end

end
