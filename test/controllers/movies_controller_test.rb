require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get the new partial form for adding a movie" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: '_form'

   movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end
end
