require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "index should show all the movies" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "new should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  test "add a new movie to the DB" do
    post_params = { movie: { title: "New Movie",
      director: "Allison" } }
    assert_difference('Movie.count', 1) do
      post :create, post_params
    end

    movie = assigns(:movie)
    assert_redirected_to movie_path(movie)
  end

  test "doesn't add an invalid movie to the DB" do
    post_params = { movie: { director: "Allison" } }
    assert_no_difference('Movie.count') do
      post :create, post_params
    end

    assert_template :new
  end

  test "should show the requested movie" do
    movie_id = movies(:valid_movie).id
    get :show, { id: movie_id }
    assert_response :success
    assert_template :show

    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end

  test "doesn't show a non-existant movie" do
    movie_id = 843
    # Bogus movie ID shouldn't be in the DB, otherwise test is invalid
    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(movie_id)
    end

    get :show, { id: movie_id }
    assert_response :not_found
  end

  test "edit should get the edit form for a movie" do
    movie_id = movies(:valid_movie).id
    get :edit, { id: movie_id }
    assert_response :success
    assert_template :edit
  end

  # test "edit doesn't get the edit form for a non-existant movie" do
  #   movie_id = 1234
  #   get :edit, { id: movie_id }
  #   assert_response :error
  # end
  #
  # test "updates a movie in the DB" do
  #   movie_id = movies(:valid_movie).id
  #   patch :update, { id: movie_id }, :valid_movie => {title: "Allison's Movie", director: "Allison"}
  #
  #   movie = assigns(:movie)
  #   assert_redirected_to movie_path(movie)
  #   assert_equal "Allison's Movie", movie.title
  # end

  test "should destroy movie" do
    movie_id = movies(:valid_movie).id
    assert_difference('Movie.count', -1) do
      delete :destroy, { id: movie_id }
    end

    assert_redirected_to movies_path
  end

  test "should redirect to the correct page" do
    movie_id = movies(:valid_movie).id
    patch :upvote, { id: movie_id }

    movie = assigns(:movie)
    assert_redirected_to movie_path(movie)
  end
end
