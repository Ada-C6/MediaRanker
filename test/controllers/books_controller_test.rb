require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'books/index' #:index
  end

  test "should get show" do
    get :show, {id: books(:book1).id}
    assert_response :success
    assert_template 'books/show'
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'books/new'
  end

  test "should be able to create" do
    params = {book: {title: 'test', num_votes: 0, author: 'bob', description: 'none'}}
    post :create, params
    assert_response :redirect
    #can't get this assert_redirected_to to work?
  end

  test "creating should add one to the database" do
    assert_difference('Book.count', 1) do
      params = {book: {title: 'test', num_votes: 0, author: 'bob', description: 'none'}}
      post :create, params
    end
  end

  test "should be able to upvote" do
    patch :upvote, {id: books(:book1).id}
    assert_response :redirect
    assert_redirected_to book_path
  end

  test "should get edit" do
    get :edit, {id: books(:book1).id}
    assert_response :success
    assert_template 'books/edit'
  end

  test "should be able to update" do
    patch :update, id: books(:book1).id, book: {title: "new title", author: "new author", description: "new descrip"}
    assert_response :redirect
    assert_redirected_to book_path
  end

  test "should be able to destroy" do
    delete :destroy, {id: books(:book1).id}
    assert_response :redirect
    assert_redirected_to books_path
  end

  test "should error on trying to destroy something that doesn't exist" do
    delete :destroy, {id: 324987324}
    assert_response :missing
  end

  test "destroying should subtract one to the database" do
    assert_difference('Book.count', -1) do
      post :destroy, {id: books(:book1).id}
    end
  end

end
