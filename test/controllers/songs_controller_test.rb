require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show song" do
    get :show, {id: songs(:anywhere).id}
    assert_response :success
    assert_template :show
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should be able to create a new song" do
    post_params = {song: {title: "Life Itself", artist: "Glass Animals", genre: "Pop", rank: 24}}
    post :create, post_params
    assert_redirected_to controller: "songs", action: "index"
  end

  test "creating a song changes the number of songs" do
    assert_difference("Song.count",1) do
      post_params = {song: {title: "Life Itself", artist: "Glass Animals", genre: "Pop", rank: 24}}
      post :create, post_params
    end
  end

  test "should get edit" do
    get :edit, {id: songs(:anywhere).id}
    assert_response :success
  end

  test "should be able to update a song" do
    put :update, {id: songs(:anywhere).id, song: {title: "Life Itself", artist: "Glass Animals", genre: "Pop", rank: 24}}
    assert_redirected_to controller: "songs", action: "show"
  end

  test "should be able to upvote a song" do
    patch :upvote, {id: songs(:anywhere).id}
    assert_redirected_to controller: "songs", action: "show"
  end
  test "should be able to downvote a song" do
    patch :downvote, {id: songs(:anywhere).id}
    assert_redirected_to controller: "songs", action: "show"
  end

  test "should be able to delete a song" do
    delete :destroy, {id: songs(:anywhere).id}
    assert_redirected_to controller: "songs", action: "index"
  end

  test "deleting a song changes the number of songs" do
    assert_difference("Song.count", -1) do
      delete :destroy, {id: songs(:anywhere).id }
    end
  end
end
