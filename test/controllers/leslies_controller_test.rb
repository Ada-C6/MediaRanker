require 'test_helper'

class LesliesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: leslies(:leslie2).id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, {leslie: {title: "Naked Gun"} }
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, {id: leslies(:leslie2).id }
    assert_response :success
  end

  test "should get update" do
    patch :update, {id: leslies(:leslie2).id }
    assert_response :success
  end

  test "should get delete" do
    delete :delete, {id: leslies(:leslie2).id }
    assert_response :redirect
  end

end
