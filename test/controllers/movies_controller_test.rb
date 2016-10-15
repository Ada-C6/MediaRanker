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

  test "add a new movie to the database (create action)" do
  assert_difference('Movie.count', 1) do
    post_params = { movie: { name: "Iris Cleans the Apartment" } }
    post :create, post_params
  end

  assert_redirected_to movie_path(Movie.last) #should redirect to the newly made movie that was added to the database
end

  test "should show the requested movie" do
   get :show, { id: movies(:two).id }
   assert_response :success
   assert_template :show

   assert_equal assigns(:movie), movies(:two)
 end

end
