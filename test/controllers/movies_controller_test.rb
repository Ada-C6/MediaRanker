require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should go to index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should go to new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "won't add an invalid movie" do
    post_params = { movie: { director: "Yolo" } }
    assert_no_difference('Movie.count') do
      post :create, post_params
    end
    assert_template :new
  end

  test "should show the requested movie" do
    movie = movies(:Reservoir_Dogs).id
    get :show, { id: movie }
    assert_response :success
    assert_template :show
    yolo = assigns(:movie)
    assert_not_nil yolo
    assert_equal yolo.id, movie
  end


  # test "should get create" do
  #   get :create
  #   assert_response :success
  #   assert_template :create
  # end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  #   assert_template :edit
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  #   assert_template :update
  # end
  #
  # test "should get delete" do
  #   get :delete
  #   assert_response :success
  #   assert_template :delete
  # end
  #
  # test "should get show" do
  #   get :show
  #   assert_response :success
  #   assert_template :show
  # end

end
