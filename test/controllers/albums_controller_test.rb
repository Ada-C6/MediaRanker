require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  # INDEX
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

    # NEW
  test "should get new form" do
    get :new
    assert_response :success
    assert_template partial: '_form'
    assert_template :new
  end

  # CREATE
  test "add a new album" do
     post_params = {album: {name: "Yolo", artist: "Yates"} }
     assert_difference("Album.count", 1) do
       post :create, post_params
     end
     assert_redirected_to albums_path
   end

  test "won't add an invalid album" do
    post_params = { album: { artist: "Yolo" } }
    assert_no_difference('Album.count') do
      post :create, post_params
    end
    assert_template :new
  end

  # SHOW
  test "should show the requested album" do
    album = albums(:Robyn_one).id
    get :show, { id: album }
    assert_response :success
    assert_template :show
    yolo = assigns(:album)
    assert_not_nil yolo
    assert_equal yolo.id, album
  end

  # EDIT
  test "should get edit form" do
    id = albums(:Britney_Spears_one).id
    get :edit, { id: id }
    assert_response :success
    assert_template :edit
  end

  # UPDATE
  test "should update the album" do
    id = albums(:Elton_one).id
    patch :update, {id: id, album: {name: "Elton_one"} }
    assert_equal "Elton_one", Album.find(id).name
    assert_redirected_to albums_path
  end

  test "update should not allow nil artist" do
       id = albums(:Smashing_Pumpkins_one).id
       patch :update, {id: id, album: {artist: nil} }
       assert_equal "Smashing Pumpkins", Album.find(id).artist
       assert_template :edit
     end

end
