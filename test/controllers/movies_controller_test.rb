require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:correct_movie)
  end

  ############### INDEX ###############
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:movies)
  end

  test "Index should populate all the records of movies" do
    get :index

    assert_equal assigns(:movies).count, Movie.count
  end

  test "Index should sort the movies by rank" do
    get :index
    movies = assigns(:movies)

    assert_operator movies[0].rank_points, :>=, movies[-1].rank_points
  end

  ############### NEW ###############
  test "New should get new page" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "New should create a new movie but not save it yet" do
    get :new
    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  ############### CREATE ###############
  test "Create should add 1 to all movies" do
    assert_difference('Movie.count', 1) do
      post :create, movie: { name: "lksjdf", director: "sdfasdf", rank_points: 0 }
    end
  end

  test "Create should redirect to created movie page" do
    post :create, movie: { name: "lkjsdf", director: "sjkfsa", rank_points: 0 }

    assert_response :found
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "Create should assign an ID to a new record" do
    post :create, movie: { name: "lkjsdf", director: "sjkfsa", rank_points: 0 }

    assert_not_nil assigns(:movie).id
  end

  test "Create should automatically give a new movie rank_points of 1" do
    post :create, movie: { name: "lkjsdf", director: "sjkfsa", rank_points: nil }

    assert_equal 1, assigns(:movie).rank_points
  end

  ############### SHOW ###############
  test "Show should show movie and template" do
    get :show, id: @movie.id
    assert_response :success
    assert_template :show
  end

  ############### EDIT ###############
  test "Edit should get edit and template" do
    get :edit, id: @movie.id
    assert_response :success
    assert_template :edit
  end

  ############### UPDATE ###############
  test "Update should correctly update movie name" do
    patch :update, id: @movie.id, movie: { name: "hey" }
    assert_equal "hey", assigns(:movie).name
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "Update should redirect to correct page" do
    patch :update, id: @movie.id, movie: { name: "sdfsdfsd" }
    assert_redirected_to movie_path(assigns(:movie))
  end

  ############### DESTROY ###############
  test "Destroy should lower movie count by one" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie.id
    end
  end

  test "Destroy should redirect to movies index" do
    delete :destroy, id: @movie.id
    assert_redirected_to movies_path
  end

  ############### VOTE ###############
  test "Vote should change rank_points by 1 if upvote" do
    patch :vote, id: @movie.id, vote: "up"
    assert_equal 17, Movie.find(@movie.id).rank_points
  end

  test "Vote should change rank_points by -1 if downvote" do
    patch :vote, id: @movie.id, vote: "down"
    assert_equal 15, Movie.find(@movie.id).rank_points
  end
end
