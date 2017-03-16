require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should show list of albums" do
    get :index
    assert_response :success
  end

  test "should show specified album" do
    get :show, {id: albums(:X).id}
    assert_response :success
  end

  test "should show new album form" do
    get :new
    assert_response :success
  end

  test "should create new album, raising album count" do
    assert_difference("Album.count", 1) do
      post :create, {album: {name: "Wow"}}
    end
    assert_response :redirect
  end

  test "should show album edit form" do
    get :edit, {id: albums(:X).id}
    assert_response :success
  end

  test "should update album information correctly" do
    put :update, id: albums(:X), album: {name: "+", artist: "Ed Sheeran", description: "Lots of cool songs."}
    album = Album.find_by(name: "+")

    assert_equal "Ed Sheeran", album.artist
    assert_response :redirect
  end

  test "should destroy album" do
    assert_difference("Album.count", -1) do
      delete :destroy, {id: albums(:X).id}
    end
  end

  test "should update album information with rank" do
    put :upvote, {id: albums(:X).id}
    assert_response :redirect
  end

end
