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
    bobby = bobs(:bobby)
    patch :update, {id: bobby.id, bob: {name: bobby.name } }
    assert_response :redirect
  end

  test "should get delete" do
    delete :delete, {id: bobs(:bobby).id }
    assert_response :redirect
  end

  test "Deleting a Bob changes the number of bobs" do
    assert_difference("Bob.count", -1) do
      delete :delete, {id: bobs(:bobby).id }
    end
  end

  test "Voting for a Bob changes vote count" do
    assert_difference("BobVote.count", 1) do
      post :upvote, {id: bobs(:bobby).id }
    end
  end

end
