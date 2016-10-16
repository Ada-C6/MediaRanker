require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get the entire list of movies" do
    # Should populate an array of movies
    # should render the :index view
    movie = movies(:nightmare)
    bad_movie = albums(:sample)
    get :index

    assert_response :success
    assert_template :index

    movies = assigns(:full_list)
    assert_not_empty(movies)
    assert_includes(movies, movie)
    assert_not_includes(movies, bad_movie)
  end

  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    item = assigns( :new_item)
    assert_not_nil item
    assert_nil item.id

  end
end
