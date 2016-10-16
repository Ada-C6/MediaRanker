require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:correct_album)
  end

  ############### INDEX ###############
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:albums)
  end

  test "Index should populate all the records of albums" do
    get :index

    assert_equal assigns(:albums).count, Album.count
  end

  test "Index should sort the albums by rank" do
    get :index
    albums = assigns(:albums)

    assert_operator albums[0].rank_points, :>=, albums[-1].rank_points
  end

  ############### NEW ###############
  test "New should get new page" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "New should create a new album but not save it yet" do
    get :new
    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  ############### CREATE ###############
  test "Create should add 1 to all albums" do
    assert_difference('Album.count', 1) do
      post :create, album: { name: "lksjdf", artist: "sdfasdf", rank_points: 0 }
    end
  end

  test "Create should redirect to created album page" do
    post :create, album: { name: "lkjsdf", artist: "sjkfsa", rank_points: 0 }

    assert_response :found
    assert_redirected_to album_path(assigns(:album))
  end

  test "Create should assign an ID to a new record" do
    post :create, album: { name: "lkjsdf", artist: "sjkfsa", rank_points: 0 }

    assert_not_nil assigns(:album).id
  end

  test "Create should automatically give a new album rank_points of 1" do
    post :create, album: { name: "lkjsdf", artist: "sjkfsa", rank_points: nil }

    assert_equal 1, assigns(:album).rank_points
  end

  ############### SHOW ###############
  test "Show should show album and template" do
    get :show, id: @album.id
    assert_response :success
    assert_template :show
  end

  ############### EDIT ###############
  test "Edit should get edit and template" do
    get :edit, id: @album.id
    assert_response :success
    assert_template :edit
  end

  ############### UPDATE ###############
  test "Update should correctly update album name" do
    patch :update, id: @album.id, album: { name: "hey" }
    assert_equal "hey", assigns(:album).name
    assert_redirected_to album_path(assigns(:album))
  end

  test "Update should redirect to correct page" do
    patch :update, id: @album.id, album: { name: "sdfsdfsd" }
    assert_redirected_to album_path(assigns(:album))
  end

  ############### DESTROY ###############
  test "Destroy should lower album count by one" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album.id
    end
  end

  test "Destroy should redirect to albums index" do
    delete :destroy, id: @album.id
    assert_redirected_to albums_path
  end

  ############### VOTE ###############
  test "Vote should change rank_points by 1 if upvote" do
    patch :vote, id: @album.id, vote: "up"
    assert_equal 11, Album.find(@album.id).rank_points
  end

  test "Vote should change rank_points by -1 if downvote" do
    patch :vote, id: @album.id, vote: "down"
    assert_equal 9, Album.find(@album.id).rank_points
  end

end
