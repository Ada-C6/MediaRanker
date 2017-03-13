require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show an book" do
    get :show, {id: books(:one).id }
    assert_response :success
  end

  test "should get a form for a new book" do
    get :new
    assert_response :success
  end

  test "should create a new book" do
    post_params = {book: {name: "newbook"}}  # "making a local variabel to control the parameters"
    post(:create, post_params)
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, {id: books(:one).id }
    assert_response :success
  end

  test "should update the book" do
    post_params = {book: {name: "newbook"}, id: books(:one).id }  # "making a local variabel to control the parameters"
    patch :update, post_params
    assert_response :redirect
    assert_redirected_to show_book_url(id: books(:one).id)
  end

  test "should delete the book and redirect" do
    delete :destroy, {id: books(:one).id }
    assert_response :redirect
    assert_redirected_to({ controller: 'books', action: 'index' })
  end

  test "If someone tried to delete something that doesn't exist an exception will be raised " do
    assert_raises(Exception) {delete :destroy, {id: 10}}  # added this in the destroy method in the controller --> rescue ArgumentError.new("This id cannot by found")
  end

  test "If someone tries to view something that doesn't exist an exception will be raised ...and reroute to a 404?" do
    # assert_raises(ActiveRecord::RecordNotFound) {delete :show, {id: 10}}  #This wound pass if I didn't rescue the error and redirect to a 404 page in the ApplicationController
    delete :show, {id: 10}
    assert_response :missing  #This checks for a redirect to a 404
  end

  test "should post an upvote" do
    @request.env['HTTP_REFERER'] = '/books/show'
    post :upvote, {id: books(:one).id }
    assert_response :redirect
  end

  test "Upvote increases the rank by 1" do
    assert_difference("Book.find(books(:one).id).rank", 1) do  # The 1 means that the count will go up by 1
      post_params = {id: books(:one).id}
      @request.env['HTTP_REFERER'] = '/books/show'
      post :upvote, post_params
    end
  end

end
