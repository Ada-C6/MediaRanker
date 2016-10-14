require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  test "should get the index view" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should have all of the movies" do
    get :index
    movies =  assigns(:movies)

    assert assigns(:movies)
    assert_not_nil movies
    assert_not_empty movies
  end

  test "show a non-extant movie" do
    movie_id = 12345
    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(movie_id)
    end
    get :show, { id: movie_id }
    assert_response :not_found
  end

  test "show the requested movie" do
    movie_id = movies(:top_gun).id
    get :show, { id: movie_id }
    assert_response :success
    assert_template :show

    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end

  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

end
