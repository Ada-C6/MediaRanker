require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  # test "add a new album to the DB" do
  #   post_params = { album: { title: "Yolo", artist: "Mdawg" } }
  #   assert_difference('Album.count', 1) do
  #     post :create, post_params
  #   end
  #   album = assigns(:album)
  #   assert_redirected_to album_path(album)
  # end

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
  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end
  #
  # test "should get delete" do
  #   get :delete
  #   assert_response :success
  # end
  #
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

end
