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

  test "Creating a Leslie changes the number of leslies" do
  assert_difference("Leslie.count", 1) do
    post_params = {leslie: {title: "Surf Ninjas"} }
    post :create, post_params
    end
  end

  test "should go to edit" do
    get :edit, {id: leslies(:leslie2).id }
    assert_response :success
  end

  test "should update" do
    leslie2 = leslies(:leslie2)
    patch :update, {id: leslie2.id, leslie: {title: leslie2.title} }
    assert_response :redirect
  end

  test "should get delete" do
    delete :delete, {id: leslies(:leslie2).id }
    assert_response :redirect
  end

  test "Deleting a Leslie changes the number of leslies" do
    assert_difference("Leslie.count", -1) do
      post_params = {id: leslies(:leslie2).id }
      delete :delete, post_params
    end
  end

  test "Voting for a Leslie changes vote count" do
    assert_difference("LeslieVote.count", 1) do
      post :upvote, {id: leslies(:leslie2).id}
    end
  end

end
