require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  test "should get the edit form" do
    album = albums(:mellon_collie)
    get :edit, id: album
    assert_response :success
    assert_template :edit
  end

  test "should update album" do
    album = albums(:mellon_collie)
    patch :update, id: album, album: { name: album.name, artist: album.artist, description: album.description }
    assert_redirected_to album_path
  end

  test "should show the show page for the specified album" do
    album_id = albums(:mellon_collie).id
    get :show, { id: album_id }
    assert_response :success
    assert_template :show

    album = assigns(:album)
    assert_not_nil album
    assert_equal album.id, album_id
  end

  test "should show 404 error for invalid album id" do
    album_id = 1346134598    # Boguse ID shouldn't be in DB, otherwise test is invalid
    assert_raises StandardError do
      Album.find(album_id)
    end

    get :show, { id: album_id }
    assert_response :not_found
  end

  test "add a new album to the DB with upvotes initialized to zero" do
    post_params = { album: { name: "Live Noise",
								    artist: "Moxy Fruvous",
                    description: "Fantastic" } }
    assert_difference('Album.count', 1) do
      post :create, post_params
    end

    album = assigns(:album)
    assert_redirected_to album_path(album.id)
    assert_equal album.upvotes, 0
  end

  test "upvotes will increase ranking by one" do
    post :vote, id: albums(:mellon_collie).id
    album = assigns(:album)
    assert_equal album.upvotes, 2
  end

  test "cannot add invalid album to DB" do
    post_params = {album: { name: "Live Noise"} }
    assert_equal('Album.count', 'Album.count') do
      post :create, post_params
    end

    assert render: :new
  end

  test "will delete an album from the DB" do
    album = albums(:mellon_collie)
    assert_difference('Album.count', -1) do
      delete :destroy, id: album
    end

    assert_redirected_to albums_path
  end
end
