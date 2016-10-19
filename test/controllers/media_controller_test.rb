require 'test_helper'

class MediaControllerTest < ActionController::TestCase


  setup do
    @medium = media(:one)
  end

  test "that upvote increments by one each time" do
    vote = media(:nine_stories).votes
    post :votes, media(:nine_stories).url_params

    assert_equal vote + 1, media(:nine_stories).reload.votes
  end

  test "should get index" do
    get :index, media(:one).url_params
    assert_response :success
    assert_not_nil assigns(:media)
  end

  test "should get new" do
    get :new, media(:one).url_params
    assert_response :success
  end

  test "should create medium" do
    assert_difference('Medium.count') do
      post :create, @medium.url_params,  medium: { media_type: "movies", name: "movie"}
    end
    assert_redirected_to medium_path(assigns(:medium))
  end


  test "should show medium" do
    get :show, media(:one).url_params
    assert_response :success
  end


  test "should get edit" do
    get :edit, media(:one).url_params
    assert_response :success
  end

  test "should update medium" do
    patch :update, @medium.url_params, medium: {}
    assert_redirected_to medium_path.url_params
  end

  test "should destroy medium" do
    assert_difference('Medium.count', -1) do
      delete :destroy, media(:one).url_params
    end

    assert_redirected_to media_path
  end
end
