require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  test "should show the show page for the specified movie" do
    movie_id = movies(:pulp_fiction).id
    get :show, { id: movie_id }
    assert_response :success
    assert_template :show

    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end

  test "should show 404 error for invalid movie id" do
    movie_id = 1346134598    # Boguse ID shouldn't be in DB, otherwise test is invalid
    assert_raises StandardError do
      Movie.find(movie_id)
    end

    get :show, { id: movie_id }
    assert_response :not_found
  end

  # test "add a new movie to the DB" do
  #   post_params = { movie: { name: "Drive",
	# 							    director: "Nicolas Winding Refn",
  #                   description: "Never seen it" } }
  #   assert_difference('Movie.count', 1) do
  #     post :create, post_params
  #   end
  #
  #   assert_redirected_to movie_path(@movie)
  # end

  test "cannot add invalid movie to DB" do
    post_params = {movie: { name: "Drive"} }
    assert_equal('Movie.count', 'Movie.count') do
      post :create, post_params
    end

    assert render: :new
  end

  # test "the truth" do
  #   assert true
  # end
end
