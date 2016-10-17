require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "load show with given album" do
    get :show, { id: albums(:one).id }
    assert_response :success
    assert_template :show
  end

  test "should 404 if trying to show an album that doesn't exist" do
    album_id = 12345
    # Artist ID shouldn't exist in the database, otherwise this test is invalid.
    assert_raises ActiveRecord::RecordNotFound do
      Album.find(album_id)
    end

    get :show, { id: album_id }

    assert_response :not_found
    
  end

  test "should create an entity with valid data" do
    post_params = { album: { title: "Grace", artist: "Hopper", description: "She's the bomb." }}
    post :create, post_params
    assert_redirected_to album_path(assigns(:album))
  end
end
