require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  # INDEX
  test "should go to index" do
    get :index
    assert_response :success
    assert_template :index
  end

  # NEW
  test "should go to new form" do
    get :new
    assert_response :success
    assert_template partial: '_form'
    assert_template :new
  end

  # CREATE
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

  # SHOW
  test "should show the requested movie" do
    movie = movies(:Reservoir_Dogs).id
    get :show, { id: movie }
    assert_response :success
    assert_template :show
    yolo = assigns(:movie)
    assert_not_nil yolo
    assert_equal yolo.id, movie
  end

  # EDIT
  test "should get edit form" do
    id = movies(:Uncle_Buck).id
    get :edit, { id: id }
    assert_response :success
    assert_template :edit
  end

  # UPDATE
  test "should update the movie" do
    id = movies(:Pulp_Fiction).id
    patch :update, {id: id, movie: {name: "Pulp_Fiction"} }
    assert_equal "Pulp_Fiction", Movie.find(id).name
    assert_redirected_to movies_path
  end

  test "update should not allow nil director" do
       id = movies(:Uncle_Buck).id
       patch :update, {id: id, movie: {director: nil} }
       assert_equal "John Hughes", Movie.find(id).director
       assert_template :edit
     end

end
