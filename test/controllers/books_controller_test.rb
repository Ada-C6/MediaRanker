require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

   test "should get show" do
    get :show, {id: books(:nap) }
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: books(:nap)}
    assert_response :success
  end

  test "should be able to update a book" do
    update_params = {book:{name: books(:nap).name, author: books(:nap).author}, id: books(:nap).id}
    put :update , update_params
    assert_response :redirect
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create a book" do
    post_params = {book:{name: "Sensory Overload", author: "Your mom"}}
    post :create, post_params
    assert_response :redirect
  end

  test "Creating a book changes the number of books" do
    assert_difference("Book.count",1) do 
       post_params = {book:{name: "Sensory Overload", author: "Your mom"}}
       post :create, post_params
    end
  end

   test "should be able to delete a book" do
    assert_difference("Book.count",-1) do 
      delete :destroy, {id: books(:nap).id}
      assert_response :redirect
    end
  end

end
