require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'albums/index'
  end

  test "should get show" do
    get :show, {id: albums(:album1).id}
    assert_response :success
    assert_template 'albums/show'

  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'albums/new'
  end

  test "should be able to create" do
    params = {album: {title: 'test', num_votes: 0, artist: 'bob', description: 'none'}}
    post :create, params
    assert_response :redirect
  end

  test "creating should add one to the database" do
    assert_difference('Album.count', 1) do
      params = {album: {title: 'test', num_votes: 0, artist: 'bob', description: 'none'}}
      post :create, params
    end
  end

  test "should be able to upvote" do
    patch :upvote, {id: albums(:album1).id}
    assert_response :redirect
    assert_redirected_to album_path
  end

  test "should get edit" do
    get :edit, {id: albums(:album1).id}
    assert_response :success
    assert_template 'albums/edit'
  end

  test "should be able to update" do
    patch :update, id: albums(:album1).id, album: {title: "new title", artist: "new artist", description: "new descrip"}
    assert_response :redirect
    assert_redirected_to album_path
  end

  test "should be able to destroy" do
    delete :destroy, {id: albums(:album1).id}
    assert_response :redirect
    assert_redirected_to albums_path
  end

  test "should error on trying to destroy something that doesn't exist" do
    delete :destroy, {id: 324987324}
    assert_response :missing
  end
  
  test "destroying should subtract one to the database" do
    assert_difference('Album.count', -1) do
      delete :destroy, {id: albums(:album1).id}
    end
  end

end
