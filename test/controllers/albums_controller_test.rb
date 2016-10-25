require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: albums(:two).id}
    assert_response :success
    assert_template :show
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "Creating an Album changes number of Albums" do
    assert_difference('Album.count', 1) do
      post_params = {album: {title: "A nice album"}}
      post :create, post_params
    end
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, {id: 1}
    assert_response :success
    assert_template :edit
  end

  test "should update existing album" do
    patch :update, id: albums(:one).id, album: { title: "title", artist: "artists"}
    assert_response :redirect
  end

  test "should upvote" do
    request.env['HTTP_REFERER'] = "where_i_came_from"
      patch :upvote, id: movies(:two).id
    assert_redirected_to("where_i_came_from")
  end

  test "should delete book" do
    delete :destroy, id: albums(:one).id
    assert_response :redirect
  end

  test "delete changes number of albums" do
    assert_difference("Album.count", -1) do
      delete :destroy, {id: albums(:one).id}
    end
  end

end
