require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: albums(:two).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, {album: {title: "Gossamer", artist: "Passion Pit", synopsis: "Noice"}}
    assert_response :redirect
  end

  test "creating an album changes the number of albums" do
    assert_difference("Album.count", 1) do
      post :create, {album: {title: "Gossamer", artist: "Passion Pit", synopsis: "Noice"}}
      assert_response :redirect
    end
  end

  test "should get edit" do
    get :edit, {id: albums(:one).id}
    assert_response :success
  end

  test "should get update" do
    patch :update, {id: albums(:one).id, album: {title: "Gossamer", artist: "Passion Pit", synopsis: "Noice"}}
    assert_response :redirect
  end

  # test "should upvote" do
  #   current_rank = albums(:two).rank
  #   patch :upvote, {id: albums(:two).id}
  #   assert_equal albums(:two).rank, current_rank + 1
  #   assert_response :redirect
  # end

  test "should get destroy" do
    delete :destroy, {id: albums(:one).id}
    assert_response :redirect
  end

  test "deleting an album changes the number of albums" do
    assert_difference("Album.count", -1) do
      delete :destroy, {id: albums(:one).id}
      assert_response :redirect
    end
  end

end
