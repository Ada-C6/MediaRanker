require 'test_helper'

class SeinfeldsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show seinfeld" do
    get :show, {id: seinfelds(:slicer).id}
    assert_response :success
    assert_template :show
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should be able to create a new seinfeld" do
    post_params = {seinfeld: {title: "The Maid", season: 9, episode: 3, rank: 40}}
    post :create, post_params
    assert_redirected_to controller: "seinfelds", action: "index"
  end

  test "creating a seinfeld changes the number of seinfelds" do
    assert_difference("Seinfeld.count",1) do
      post_params = {seinfeld: {title: "The Maid", season: 9, episode: 3, rank: 40}}
      post :create, post_params
    end
  end

  test "should get edit" do
    get :edit, {id: seinfelds(:slicer).id}
    assert_response :success
  end

  test "should be able to update a seinfeld" do
    put :update, {id: seinfelds(:slicer).id, seinfeld: {title: "The Maid", season: 9, episode: 3, rank: 40}}
    assert_redirected_to controller: "seinfelds", action: "show"
  end

  test "should be able to upvote a seinfeld" do
    patch :upvote, {id: seinfelds(:slicer).id}
    assert_redirected_to controller: "seinfelds", action: "show"
  end
  test "should be able to downvote a seinfeld" do
    patch :downvote, {id: seinfelds(:slicer).id}
    assert_redirected_to controller: "seinfelds", action: "show"
  end

  test "should be able to delete a seinfeld" do
    delete :destroy, {id: seinfelds(:slicer).id}
    assert_redirected_to controller: "seinfelds", action: "index"
  end

  test "deleting a seinfeld changes the number of seinfelds" do
    assert_difference("Seinfeld.count", -1) do
      delete :destroy, {id: seinfelds(:slicer).id }
    end
  end

  test "responds with error if file isn't found" do
    delete :destroy, {id: 1000}
    assert_response :missing
  end

end
