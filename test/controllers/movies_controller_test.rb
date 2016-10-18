require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  test "show the requested movie" do
    movie_id = movies(:bamboozled).id
    get :show, { id: movie_id }
    assert_response :success
    assert_template :show

    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end
end
