require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: 'layouts/_form', count: 1

    movie = assigns(:movie) #this checks that we do have an instance variable
    assert_not_nil movie
    assert_nil movie.id #check that the id is nil because it hasn't been saved to the database
  end

  test "should show a specific/requested movie" do #positive test case
    movie_id = movies(:et).id
    get :show, { id: movie_id } #start with request
    assert_response :success
    assert_template :show
    assert_template partial: 'layouts/_show', count: 1

    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end

  test "Show a non-extant movie" do #negative test case
    movie_id = "a"

    assert_raises  ActiveRecord::RecordNotFound do
      Movie.find(movie_id) #make sure this movie doesn't exist
    end #what to do if this movie id does match? Add 1 to the id and try again.

    get :show, { id: movie_id } #start with request
    assert_response :not_found # :missing is a different code
  end

  test "add a new movie to the DB" do
    post_params = { movie: { title: "Tycho",
                 by: "San Francisco" } }
    assert_difference('Movie.count', 1) do
      post :create, post_params
    end

    assert_redirected_to movie_path(assigns(:movie).id)
  end

  test "does not add new movie without valid params" do
    post_params = { movie: {
                 description: "San Francisco" } }
    assert_difference('Movie.count', 0) do
      post :create, post_params
    end

    assert_template :new
  end

  test "shows all movies" do
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'layouts/_index', count: 1
  end

  test "should get the edit form" do
    movie_id = movies(:my_girl).id
    get :edit, { id: movie_id }
    assert_response :success
    assert_template :edit
    assert_template partial: 'layouts/_form', count: 1

    movie = assigns(:movie)
    assert_not_nil movie
  end

  test "should update the movie" do
    movie = movies(:my_girl)

    assert_difference('Movie.count', 0) do
      put :update, id: movie.id, movie: { title: "Tycho", by: "San Francisco" }
    end

    assert_response :found
    assert_equal Movie.find(movie.id).title, "Tycho"
    assert_redirected_to movie_path(movie.id)
  end

  test "should render edit page if update does not save and does not save empty string" do
    movie = movies(:my_girl)
    put :update, id: movie.id, movie: {title: ""}
    assert_template :edit
  end

  test "upvote should increase ranked by one and not change any other attributes" do
    fix_movie = movies(:et)
    assert_difference('Movie.find(fix_movie.id).ranked', 1) do
      patch :update, id: fix_movie.id, movie: { title: "uh" }
    end

    assert_not_equal Movie.find(fix_movie.id).title, "uh"

    assert_response :found

    movie = assigns(:movie)
    assert_equal movie.ranked, fix_movie.ranked + 1, "Assigns Attributes: #{movie.attributes} Fixed ID: #{fix_movie.id}, assigns id: #{assigns(:movie)}"

    assert_redirected_to movie_path(fix_movie.id)
  end

  test "remove a movie from the DB" do
    movie_id = movies(:et).id

    assert_difference('Movie.count', -1) do
      delete :destroy, { id: movie_id }
    end

    assert_response :redirect
    assert_redirected_to movies_path

    assert_not_includes assigns, movies(:et)
  end
end
