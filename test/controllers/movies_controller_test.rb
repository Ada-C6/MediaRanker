require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "(new) should get the movie new form page" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: 'partial/_form', count: 1
    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  test "show the requested movie" do
    movie_id= movies(:valid_data).id
    get :show, { id: movie_id }
    assert_response :success
    assert_template :show
    assert_template partial: 'partial/_show', count: 1
    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end

  test "(edit) should get the movie edit form page" do
    movie_id= movies(:valid_data).id
    get :edit, {id: movie_id}
    assert_response :success
    assert_template :edit
    assert_template partial: 'partial/_form', count: 1
    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end

  test "should update movie" do
    movie_id= movies(:valid_data).id
    assert_difference('Movie.count', 0) do
      patch :update, id: movie_id , movie: { name: "name", discription: "discription" }
    end
    assert_redirected_to movie_path(movie_id)
  end
  #create movie
  test "should create movie" do
    params = {
      movie: {
        name: "movie 1",
        director: "movie1",
        description: "description 1"
   } }
    post :create, params
  end

  test "index should get all the movies" do
    all_movies = assigns(:movies)
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'partial/_index', count: 1
    assert_not_nil movies
  end

  test "should destroy movie" do
    movie_id= movies(:valid_data).id
    assert_difference('Movie.count', -1) do
      delete :destroy, id: movie_id
    end
    assert_redirected_to movies_path
  end
end
