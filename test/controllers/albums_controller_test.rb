require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "show the requested album" do
    album_id = albums(:red).id
    get :show, {id: album_id}
    assert_response :success
    assert_template :show
    assert_equal assigns(:album), albums(:red)
  end

  test "show the error message for a non-existing album" do
    album_id = 1232432432432
    assert_raises ActiveRecord::RecordNotFound do
      Album.find(album_id)
    end

    get :show, { id: album_id }
    assert_response :not_found
  end

  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.name
  end

  test "should create a album with valid inputs" do
    assert_difference('Album.count', 1) do
      post_params = { album: { name: "Hello", artist: "Goodbye"}}
      post :create, post_params
    end

    assert_redirected_to albums_path
  end

  test "cannot create a album without valid inputs and will render the new form" do
    assert_no_difference('Album.count') do
      post_params = { album: { name: nil, artist: nil}}
      post :create, post_params
    end
    assert_template :new
    assert_response :success
  end

  test "should get the form to edit an existing album" do
    get :edit, { id: albums(:red).id}
    assert_response :success
    assert_template 'albums/edit'
    assert_template partial: '_form', count: 1

    album = assigns(:album)
    assert_not_nil album
    assert_not_nil album.name
  end

  test "should update an existing album with valid new inputs" do
    album = albums(:red)

    assert_no_difference('Album.count') do
      patch :update, id: album.id, album: { name: "Hello Billy" }
    end

    assert album.reload
    assert_equal "Hello Billy", album.name

    assert_redirected_to album_path(album.id)
    assert_response :redirect
  end

  test "cannot update a album without valid inputs and will render the 'edit' form" do
    album = albums(:red)

    assert_no_difference('Album.count') do
      patch :update, id: album.id, album: { name: nil }
    end

    assert album.reload
    assert_template :edit
    assert_response :success
  end

  test "should change the value of the 'ranked' data field when call the 'upvote' method" do
    album = albums(:miracle)
    patch :upvote, id: album.id
    assert album.save
    assert_redirected_to album_path(album.id)
    assert_response :redirect
  end

  test "can destroy a album" do
    album = albums(:miracle)
    assert_difference('Album.count', -1) do
      delete :destroy, id: album.id
    end
    assert_redirected_to albums_path
    assert_response :redirect
  end
end
