require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: albums(:one)}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create an object" do
    params = {album: {name: "michaelJ"}}
    post :create, params
    assert_response :redirect
  end

  test "should create an object and increase count" do
    assert_difference("Album.count", 1) do
      params = {album: {name: "the wall"}}
      post :create, params
    end
  end

  test "should get edit" do
    get :edit, {id: albums(:one)}
    assert_response :success
  end

  test "should update object" do
    patch :update, {id: albums(:one), album: {name: "the wall"}}
    assert_equal Album.find(albums(:one).id).name, "the wall"
    assert_response :redirect
  end

  test "should delete object" do
    assert_difference("Album.count", -1) do
      delete :destroy, {id: albums(:one)}
      assert_response :redirect
    end
  end

end
