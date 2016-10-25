require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: movies(:one)}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create object" do
    params = {movie: {name: "free willy"}}
    post :create, params
    assert_response :redirect
  end

  test "should create an object and increase count" do
    assert_difference("Movie.count", 1) do
      params = {movie: {name: "inside out"}}
      post :create, params
    end
  end

  test "should get edit" do
    patch :edit, {id: movies(:one)}
    assert_response :success
  end

  test "should update object" do
    get :update, {id: movies(:one), movie: {name: "shrek"}}
    assert_equal Movie.find(movies(:one).id).name, "shrek"
    assert_response :redirect
  end

  test "should delete object" do
    assert_difference("Movie.count", -1) do
      delete :destroy, {id: movies(:one)}
      assert_response :redirect
    end
  end

end
