require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:album_7)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album" do
    assert_difference('Album.count') do
      post :create, album: { name: "Silver Bell", artist: "Patty Griffin" }
    end

    assert_redirected_to album_path(assigns(:album))
  end

  test "should show album" do
    get :show, id: @album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album
    assert_response :success
  end

  test "should update album" do
    patch :update, id: @album, album: { name: "Bear Creek", artist: "Brandi Carlile" }
    assert_equal assigns(:album).name, "Bear Creek"
    assert_redirected_to album_path(assigns(:album))
  end

  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end

    assert_redirected_to albums_path
  end

  test "upvote should increment ranking attribute" do
    @album = albums(:album_4)
    initial_ranking = @album.ranking
    patch :upvote, { id: @album.id }

    assert_equal assigns(:album).ranking, initial_ranking + 1
    # had attempted to use assert_difference here - tried about 15 different syntaxes unsuccessfully before using assert_equal
  end
end
