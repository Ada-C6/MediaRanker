require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "index should show all the albums" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "new should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  test "add a new album to the DB" do
    post_params = { album: { title: "New Album",
      artist: "Allison" } }
    assert_difference('Album.count', 1) do
      post :create, post_params
    end

    album = assigns(:album)
    assert_redirected_to album_path(album)
  end

  test "doesn't add an invalid album to the DB" do
    post_params = { album: { artist: "Allison" } }
    assert_no_difference('Album.count') do
      post :create, post_params
    end

    assert_template :new
  end

  test "should show the requested album" do
    album_id = albums(:valid_album).id
    get :show, { id: album_id }
    assert_response :success
    assert_template :show

    album = assigns(:album)
    assert_not_nil album
    assert_equal album.id, album_id
  end

  # test "doesn't show a non-existant album" do
  #   album_id = 843
  #   # Bogus album ID shouldn't be in the DB, otherwise test is invalid
  #   assert_raises ActiveRecord::RecordNotFound do
  #     Album.find(album_id)
  #   end
  #
  #   get :show, { id: album_id }
  #   assert_response :not_found
  # end

  test "edit should get the edit form for a album" do
    album_id = albums(:valid_album).id
    get :edit, { id: album_id }
    assert_response :success
    assert_template :edit
  end

  # test "edit doesn't get the edit form for a non-existant album" do
  #   album_id = 1234
  #   get :edit, { id: album_id }
  #   assert_response :error
  # end
  #
  # test "updates a album in the DB" do
  #   album_id = albums(:valid_album).id
  #   patch :update, { id: album_id }, :valid_album => {title: "Allison's Album", artist: "Allison"}
  #
  #   album = assigns(:album)
  #   assert_redirected_to album_path(album)
  #   assert_equal "Allison's Album", album.title
  # end

  test "should destroy album" do
    album_id = albums(:valid_album).id
    assert_difference('Album.count', -1) do
      delete :destroy, { id: album_id }
    end

    assert_redirected_to albums_path
  end

  test "should redirect to the correct page" do
    album_id = albums(:valid_album).id
    patch :upvote, { id: album_id }

    album = assigns(:album)
    assert_redirected_to album_path(album)
  end
end
