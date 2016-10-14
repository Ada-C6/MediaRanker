require 'test_helper'

class BobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: bobs(:bobby).id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, {bob: {name: "Bobby Boy"} }
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, {id: bobs(:bobby).id }
    assert_response :success
  end

  test "should get update" do
    patch :update, {id: bobs(:bobby).id }
    assert_response :success
  end

  test "should get delete" do
    delete :delete, {id: bobs(:bobby).id }
    assert_response :redirect
  end

end
