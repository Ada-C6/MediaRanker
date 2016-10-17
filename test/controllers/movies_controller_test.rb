require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:movie_3)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, movie: { name: "D.E.B.S.", director: "Angela Robinson" }
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
    get :show, id: @movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie
    assert_response :success
  end

  test "should update movie" do
    patch :update, id: @movie, movie: { name: "Sleepless in Seattle", director: "Nora Ephron" }
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie
    end

    assert_redirected_to movies_path
  end

  test "upvote should increment ranking attribute" do
    @movie = movies(:movie_4)
    initial_ranking = @movie.ranking
    patch :upvote, { id: @movie.id }

    assert_equal assigns(:movie).ranking, initial_ranking + 1
    # had attempted to use assert_difference here - tried about 15 different syntaxes unsuccessfully before using assert_equal
  end
end
