require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  test "should go to index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should go to new form" do
    get :new
    assert_response :success
    assert_template partial: '_form'
    assert_template :new
  end

  test "add a new movie" do
     post_params = {movie: {name: "Yolo", director: "Nickelback"} }
     assert_difference("Movie.count", 1) do
       post :create, post_params
     end
     assert_redirected_to movies_path
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

end
