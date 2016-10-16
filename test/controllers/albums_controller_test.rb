require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should show the requested album" do
    get :show, { id: albums(:a_hard_days_night).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:album), albums(:a_hard_days_night)
  end

  test "Show a non-existant album" do
    album_id = 12345
    # Bogus album ID shouldn't be in the DB, otherwise test is invalid
    assert_raises ActiveRecord::RecordNotFound do
      Album.find(album_id)
      get :show, { id: album_id }
      assert_response :not_found
    end
  end

  test "should update ranking" do
    album_id = albums(:a_hard_days_night).id
    assert_difference("Album.find(#{album_id}).ranking", 1) do
      patch :upvote, { id: album_id }
    end
  end

  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  test "add a new album to the DB" do
    post_params = { album: { name: "The Dark Side of the Moon", artist: "Pink Floyd" } }

    assert_difference('Album.count', 1) do
      post :create, post_params
    end

    assert_redirected_to album_path(Album.last.id)
  end

  test "does not add an invalid album to the DB" do
    post_params = { album: {artist: "No One" } }

    assert_difference('Album.count', 0) do
      post :create, post_params
    end
  end

  test "should get the edit form for an existing album" do
    get :edit, { id: albums(:a_hard_days_night).id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_form'

    album = assigns(:album)
    assert_not_nil album
    assert_not_nil album.id
  end

  test "should update album" do
    album = albums(:a_hard_days_night)
    description = "other description"
    album.update( {description: description} )

    assert_response :success
  end

  test "should destroy" do
    album_id = albums(:a_hard_days_night).id

    assert_difference('Album.count', -1) do
      delete :destroy, { id: album_id }
    end

    assert_redirected_to albums_path
  end

end
