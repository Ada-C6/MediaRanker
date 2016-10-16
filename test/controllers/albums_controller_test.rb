require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: 'layouts/_form', count: 1

    album = assigns(:album) #this checks that we do have an instance variable
    assert_not_nil album
    assert_nil album.id #check that the id is nil because it hasn't been saved to the database
  end

  test "should show a specific/requested album" do #positive test case
    album_id = albums(:alabama_shakes).id
    get :show, { id: album_id } #start with request
    assert_response :success
    assert_template :show
    assert_template partial: 'layouts/_show', count: 1

    album = assigns(:album)
    assert_not_nil album
    assert_equal album.id, album_id
  end

  test "Show a non-extant album" do #negative test case
    album_id = "a"

    assert_raises  ActiveRecord::RecordNotFound do
      Album.find(album_id) #make sure this album doesn't exist
    end #what to do if this album id does match? Add 1 to the id and try again.

    get :show, { id: album_id } #start with request
    assert_response :not_found # :missing is a different code
  end

  test "add a new album to the DB" do
    post_params = { album: { title: "Tycho",
                 by: "San Francisco" } }
    assert_difference('Album.count', 1) do
      post :create, post_params
    end

    assert_redirected_to album_path(assigns(:album).id)
  end

  test "does not add new album without valid params" do
    post_params = { album: {
                 description: "San Francisco" } }
    assert_difference('Album.count', 0) do
      post :create, post_params
    end

    assert_template :new
  end

  test "shows all albums" do
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'layouts/_index', count: 1
  end

  test "should get the edit form" do
    album_id = albums(:juanes).id
    get :edit, { id: album_id }
    assert_response :success
    assert_template :edit
    assert_template partial: 'layouts/_form', count: 1

    album = assigns(:album)
    assert_not_nil album
  end

  test "should update the album" do
    album = albums(:juanes)

    assert_difference('Album.count', 0) do
      put :update, id: album.id, album: { title: "Tycho", by: "San Francisco" }
    end

    assert_response :found
    assert_equal Album.find(album.id).title, "Tycho"
    assert_redirected_to album_path(album.id)
  end

  test "should render edit page if update does not save and does not save empty string" do
    album = albums(:juanes)
    put :update, id: album.id, album: {title: ""}
    assert_template :edit
  end

  test "upvote should increase ranked by one and not change any other attributes" do
    fix_album = albums(:alabama_shakes)
    assert_difference('Album.find(fix_album.id).ranked', 1) do
      patch :update, id: fix_album.id, album: { title: "uh" }
    end

    assert_not_equal Album.find(fix_album.id).title, "uh"

    assert_response :found

    album = assigns(:album)
    assert_equal album.ranked, fix_album.ranked + 1, "Assigns Attributes: #{album.attributes} Fixed ID: #{fix_album.id}, assigns id: #{assigns(:album)}"

    assert_redirected_to album_path(fix_album.id)
  end

  test "remove a album from the DB" do
    album_id = albums(:alabama_shakes).id

    assert_difference('Album.count', -1) do
      delete :destroy, { id: album_id }
    end

    assert_response :redirect
    assert_redirected_to albums_path

    assert_not_includes assigns, albums(:alabama_shakes)
  end
end
