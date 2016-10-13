require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: movies(:babe).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: 1}
    assert_response :success
  end

  test "Creating an Movie changes the number of movies" do
    assert_difference("Movie.count", 1) do
    params = {movie: {name: "Star Wars"}}
    post :create, params
    end
  end

  test "Should be able to create an movie" do
    params = {movie: {name: "Star Wars"}}
    post :create, params
    assert_response :redirect
  end

  test "should be able to update an movie" do
    patch :update, {id: movies(:babe), movie: {name: "Meet Joe Black"}}
    assert_response :redirect
  end

  test "Should be able to delete" do
    delete :destroy, {id: movies(:babe).id}
    assert_response :redirect
  end

  test "Should be able to delete 'babe'" do
    assert_difference("Movies.count", -1) do
      delete :destroy, {id: movies(:babe)}
      assert_response :redirect
    end
  end

end
