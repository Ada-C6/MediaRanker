require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get the edit form for an existing album to edit" do
    get :edit, { id: albums(:first).id }
    assert_response :success
    assert_template :edit
  end

  test "should create a new album" do
    album_params = { album: { name: "Classics", artist: "Many", description: "Many clasics", ranking: 5 }}
    post :create, album_params
    assert_redirected_to albums_path
  end

  test "load show with given album id" do
    get :show, { id: albums(:first).id }
    assert_response :success
    assert_template :show
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "can create an album" do
    get :new
    assert_response :success

    album_params = { album: { name: "can create", artist: "article", description: "successfully.", ranking: 12 } }
    post :create, album_params
    assert_response :redirect
    # follow_redirect
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
  end

end
