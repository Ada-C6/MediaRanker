require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  ################## INDEX ##################
  test "Index should display correctly" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "Index should populate all the records of albums" do
    get :index

    assert_equal assigns(:albums).count, Album.count
  end

  ################## CREATE ##################
  test "Create should add one to all Albums" do
    assert_difference("Album.count", 1) do
      post :create, album: { name: "lkjsdf", artist: "sjkfsa", rank_points: 0 }
    end
  end

  test "Create should redirect to albums#index" do
    post :create, album: { name: "lkjsdf", artist: "sjkfsa", rank_points: 0 }
    assert_response :found
    assert_redirected_to :albums
  end

  ################## NEW ##################
  test "should get the new form for a new albums" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  ################## EDIT ##################
  test "should get the edit form for a new albums" do
    get :edit
    assert_response :success
    assert_template :edit

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end
  ################## SHOW ##################

  ################## UPDATE ##################

  ################## DESTROY ##################

  ################## VOTE ##################

end
