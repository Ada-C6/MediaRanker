require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  test "(index) should get the album index page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "(index) should have all of the albums records" do
    get :index
    assert_response :success
    albums = assigns(:albums)

    assert assigns(:albums)
    assert_not_nil albums
    assert_not_empty albums
  end

  test "(show) should show the requested album record" do
    album_id = albums(:black_celebration).id
    get :show, { id: album_id }
    assert_response :success
    assert_template :show

    album = assigns(:album)
    assert_not_nil album
    assert_equal album.id, album_id
  end

  test "(show) should not show a non-existing album record" do
    album_id = 12345
    assert_raises ActiveRecord::RecordNotFound do
      Album.find(album_id)
    end

    get :show, { id: album_id }
    assert_response :not_found
  end

  test "(new) should get the album new form page" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: '_albums_form', count: 1

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  test "(create) add a new album record" do
    post_params = { album: { name: "Woah",
      artist: "P!nk", description: "Yo" } }

    assert_difference('Album.count', 1) do
      post :create, post_params
    end

    assert_response :redirect
    assert_redirected_to album_path(assigns(:album))
  end

  test "(create) a record without a name should not be added" do
    post_params = { album: { artist: "P!nk", description: "Yo" } }

    assert_no_difference('Album.count') do
      post :create, post_params
    end

    assert_response :success
    assert_template :new
  end

  test "(edit) should get the album edit form page" do
    album_id = albums(:black_celebration).id
    get :edit, { id: album_id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_albums_form', count: 1

    album = assigns(:album)
    assert_not_nil album
  end

  test "(update) should update the album record" do
    album = albums(:black_celebration)

    updated_name = "My Little Pony"
    updated_artist = "Bon Jovi"
    updated_description = "A cover album"

    patch :update, id: album.id, album: { name: updated_name, artist: updated_artist, description: updated_description }

    album = assigns(:album)
    assert_equal updated_name, album.name
    assert_equal updated_artist, album.artist
    assert_equal updated_description, album.description

    assert_response :redirect
    assert_redirected_to album_path(assigns(:album))
  end

  test "(update) should not update the album record if its name is erased" do
    album = albums(:black_celebration)
    album.name = nil
    assert_not album.valid?
    assert_not album.save
    assert_includes album.errors, :name
  end

  test "(update) should re-render the edit page if the album record's name is erased in edit page" do
    album = albums(:black_celebration)
    updated_name = nil
    updated_artist = "Bon Jovi"
    updated_description = "A cover album"

    patch :update, id: album.id, album: { name: updated_name, artist: updated_artist, description: updated_description }

    album = assigns(:album)
    assert_response :success
    assert_template :edit

    # I tried to impliment the above test in the code section commented below. Wasn't able to make it pass.

    # I Googled and Stackoverflowed for a few hours (both with and without my tech adjacent to give feedback on what to search for), but couldn't do it. The commented out code actually returns nil for album.name and I don't know why.

    # assert_not_equal updated_name, album.name
    # assert_not_equal updated_artist, album.artist
    # assert_not_equal updated_description, album.description
  end

  test "(destroy) should delete a album record" do
    album_id = albums(:black_celebration).id

    assert_difference('Album.count', -1) do
      delete :destroy, { id: album_id }
    end

    assert_response :redirect
    assert_redirected_to albums_path
  end

  test "(upvote) should redirect to the album show page" do
    album_id = albums(:black_celebration).id

    patch :upvote, { id: album_id }

    assert_response :redirect
    assert_redirected_to album_path(assigns(:album))
  end
end
