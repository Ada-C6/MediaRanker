require 'test_helper'

class CapstoneControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: capstones(:one).id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: capstones(:one).id}
    assert_response :success
  end

  test "should be able to create" do
    post_params = { capstone: {name: "idea3", description: "a capstone suggestion"} }
    post :create, post_params
    assert_response :redirect
  end

  test "creating a new capstone changes the number of projects" do
    assert_difference("Capstone.count", 1) do
      post_params = { capstone: {name: "another project", description: "a capstone suggestion"} }
      post :create, post_params
    end
  end

  test "should be able to update a capstone" do
    patch :update, :id => capstones(:one), :capstone => {description: "a capstone suggestion"}
    assert_equal "a capstone suggestion", assigns(:capstone).description
    assert_response :success
  end

  test "should be able to delete" do
    delete :destroy, {id: capstones(:one).id}
    assert_response :redirect
  end

  test "should be able to delete idea1" do
    assert_difference("Capstone.count", -1) do
      delete :destroy, { id: capstones(:one).id }
    end
  end
end
