require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "show the requested album" do
    album_id = albums(:bad_company).id

    get :show, {id: album_id}
    assert_response :success
    assert_template :show

    album = assigns(:album)
    assert_not_nil album
    assert_equal album.id, album_id
  end

  test "show an album that doesn't exist" do
    album_id = 12345

    assert_raises ActiveRecord::RecordNotFound do
      Album.find(album_id)
    end

    get :show, {id: album_id}
    assert_response :not_found
  end

  test "should get the new form" do
    get :new
    assert_template :new
    assert_template partial: '_form'
    assert_response :success
  end

  test "add a new album to the database" do
    post_params = {album: {name: "Anna Molly", artist: "Incubus"} }
    assert_difference("Album.count", 1) do
      post :create, post_params
    end

    assert_redirected_to albums_path
  end

  test "an album with no name can't change the database" do
    post_params = { album: {artist: "someone", description: "empty values"}}

    assert_no_difference("Album.count") do
      post :create, post_params
    end

    assert_template :new
  end

  test "an album with no artist can't change the database" do
    post_params = { album: {name: "something", description: "empty values"}}

    assert_no_difference("Album.count") do
      post :create, post_params
    end

    assert_template :new
  end

  test "should get the edit form" do
    album_id = albums(:bad_company).id
    get :edit, {id: album_id}
    assert_template :edit
    assert_template partial: '_form'
    assert_response :success

    album = assigns(:album)
    assert_not_nil album
    assert_equal album.id, album_id
  end

  test "update should change the album" do
    album_id = albums(:blue).id
    patch :update, {id: album_id, album: {name: "Blue!"} }
    assert_equal "Blue!", Album.find(album_id).name

    assert_redirected_to album_path
  end

  test "update should not allow nil name" do
    album_id = albums(:blue).id
    patch :update, {id: album_id, album: {name: nil} }

    assert_equal "Blue", Album.find(album_id).name

    assert_template :edit
  end

  test "update should not allow nil artist" do
    album_id = albums(:blue).id
    patch :update, {id: album_id, album: {artist: nil} }

    assert_equal "Third Eye Blind", Album.find(album_id).artist
    assert_template :edit
  end

  test "destroy should delete the item" do
    album_id = albums(:blue).id

    assert_difference("Album.count", -1) do
      delete :destroy, {id: album_id}
    end

    assert_raises ActiveRecord::RecordNotFound do
      Album.find(album_id)
    end

    assert_redirected_to albums_path
  end

  test "upvote should increment rank by one" do
    album_id = albums(:bad_company).id

    assert_difference("Album.find(album_id).rank", 1) do
      patch :upvote, {id: album_id}
    end

    assert_redirected_to album_path(album_id)
  end

  test "upvote should set nil ranks to one" do
    album_id = albums(:nil_rank).id

    assert_difference("Album.find(album_id).rank", 1) do
      patch :upvote, {id: album_id}
    end
  end
end
