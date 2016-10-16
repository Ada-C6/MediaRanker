require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should show the requested movie" do
    get :show, { id: movies(:charlottes_web).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:movie), movies(:charlottes_web)
  end

  test "Show a non-existant movie" do
    movie_id = 12345
    # Bogus movie ID shouldn't be in the DB, otherwise test is invalid
    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(movie_id)
      get :show, { id: movie_id }
      assert_response :not_found
    end
  end

  test "should update ranking" do
    movie_id = movies(:charlottes_web).id
    assert_difference("Movie.find(#{movie_id}).ranking", 1) do
      patch :upvote, { id: movie_id }
    end
  end

  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  test "add a new movie to the DB" do
    post_params = { movie: { name: "Forrest Gump", director: "Robert Zemeckis" } }

    assert_difference('Movie.count', 1) do
      post :create, post_params
    end

    assert_redirected_to movie_path(Movie.last.id)
  end

  test "does not add an invalid movie to the DB" do
    post_params = { movie: {director: "No One" } }

    assert_difference('Movie.count', 0) do
      post :create, post_params
    end
  end

  test "should get the edit form for an existing movie" do
    get :edit, { id: movies(:charlottes_web).id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_form'

    movie = assigns(:movie)
    assert_not_nil movie
    assert_not_nil movie.id
  end

  test "should update movie" do
    movie = movies(:charlottes_web)
    description = "other description"
    movie.update( {description: description} )

    assert_response :success
  end

  test "should destroy" do
    movie_id = movies(:charlottes_web).id

    assert_difference('Movie.count', -1) do
      delete :destroy, { id: movie_id }
    end

    assert_redirected_to movies_path
  end

end
