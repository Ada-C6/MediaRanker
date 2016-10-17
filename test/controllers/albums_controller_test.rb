require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get new form" do
    get :new
    assert_response :success
    assert_template partial: '_form'
    assert_template :new
  end

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

  test "should show the requested album" do
    album = albums(:Robyn_one).id
    get :show, { id: album }
    assert_response :success
    assert_template :show
    yolo = assigns(:album)
    assert_not_nil yolo
    assert_equal yolo.id, album
  end

  test "should get edit form" do
    id = albums(:Britney_Spears_one).id
    get :edit, { id: id }
    assert_response :success
    assert_template :edit
  end

end
