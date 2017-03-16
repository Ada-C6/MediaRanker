require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should show list of albums" do
    get :index
    assert_response :success
  end

  test "should show specified album" do
    get :show, {id: albums(:X).id}
    assert_response :success
  end

  test "should show new album form" do
    get :new
    assert_response :success
  end

  test "should create new album" do
    post :create, {album: {name: "Wow"}}
    assert_response :redirect
  end

  test "should show album edit form" do
    get :edit, {id: albums(:X).id}
    assert_response :success
  end

  test "should update album information" do
    put :update, {id: albums(:X).id}
    assert_response :redirect
  end

  test "should destroy album" do
    delete :destroy, {id: albums(:X).id}
    assert_response :redirect
  end

end
