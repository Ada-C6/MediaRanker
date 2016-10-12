require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: albums(:suburbs).id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: albums(:suburbs).id}
    assert_response :success
  end

  test "should be able to update" do
    patch :update, :id => albums(:suburbs), :album => {:title => 'Suburbs'}
    assert_equal "Suburbs", assigns(:album).title
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should be able to create an album" do
    post_params = {album: {title: "Absolution"}}
    post :create, post_params
    assert_response :success
  end

  test "creating an album changes the number of albums" do
  assert_difference("Album.count", 1) do
    post_params = {album: {title: "Absolute", recorded_by: "Muse", description: "Good stuff."}}
    post :create, post_params
  end
end

  test "should be able to delete an album" do
    delete :destroy, {id: albums(:suburbs).id}
    assert_response :redirect
    assert_redirected_to albums_path
  end

  test "deleting an album changes the number of albums" do
    assert_difference("Album.count", -1) do
      delete :destroy, {id: albums(:suburbs).id}
    end
  end

end
