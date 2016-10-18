require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @movie = movies(:selena)
  end

  test "should show the specific movie" do
    get :show, { id: movies(:terminator).id }
    assert_response :success
    assert_template :show
    assert_equal assigns(:movie), movies(:terminator)
  end

  test "should create a movie" do
    assert_difference('Movie.count') do
      post :create, movie: {name: @movie.name, year: @movie.year}
    end
    assert_redirected_to movies_path
  end

  test "should destroy a movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie
    end
    assert_redirected_to movies_path
  end

  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new
    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

end
