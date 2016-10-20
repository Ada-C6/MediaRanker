require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get the entire list of albums" do
    # Should populate an array of albums
    # should render the :index view
    album = albums(:sample)
    bad_album = movies(:nightmare)
    get :index

    assert_response :success
    assert_template :index

    albums = assigns(:full_list)
    assert_not_empty(albums)
    assert_includes(albums, album)
    assert_not_includes(albums, bad_album)
  end

  #SHOW

  test "should show details of album" do
    album_id = albums(:sample).id

    get :show, {id: album_id}

    assert_response :success
    assert_template :show

    album = assigns(:this_item)
    assert_not_nil album
    assert_equal album_id, album.id
  end

  test "show a non_extant album" do
    album_id = Album .last.id + 1

    assert_raises ActiveRecord::RecordNotFound do
      Album .find(album_id)
    end

  end

  #NEW
  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new

    item = assigns( :new_item)
    assert_not_nil item
    assert_nil item.id
  end

  # CREATE
  test "should add a new album to the DB" do

    post_params = { album: { name: "Devil wears Prada", artist: "no clue", description: "Meryl Strepe(?) and Anne Hathaway"} }

    assert_difference('Album .count', 1) do
      post :create, post_params
    end

    assert_redirected_to albums_path
  end

  #EDIT
  test "should get the form of a album to edit" do
    get :edit, id: albums(:sample).id
    assert_response :success
    assert_template :edit
  end

  #UPDATE
  test "should update the album" do
    album_params = {name: "Edit", director: "Sucessfully", description: "Please."}

    patch :update, :id => albums(:sample).id, album:  album_params
    assert_redirected_to show_album_path(albums(:sample).id)

  end

  #DESTROY
  test "should destroy entry" do
    assert_difference('Album .count', -1) do
      delete :destroy, id: albums(:sample).id
    end

    assert_redirected_to albums_path
  end

end
