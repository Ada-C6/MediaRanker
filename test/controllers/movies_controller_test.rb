require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "show the requested movie" do
    movie_id = movies(:titanic).id
    get :show, {id: movie_id}
    assert_response :success
    assert_template :show
    assert_equal assigns(:movie), movies(:titanic)
  end

  test "show the error message for a non-existing movie" do
    movie_id = 1232432432432
    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(movie_id)
    end

    get :show, { id: movie_id }
    assert_response :not_found
  end

  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.name
  end

  test "should create a movie with valid inputs" do
    assert_difference('Movie.count', 1) do
      post_params = { movie: { name: "Hello", director: "Goodbye"}}
      post :create, post_params
    end

    assert_redirected_to movies_path
  end

  test "cannot create a movie without valid inputs and will render the new form" do
    assert_no_difference('Movie.count') do
      post_params = { movie: { name: nil, director: nil}}
      post :create, post_params
    end
    assert_template :new
    assert_response :success
  end

  test "should get the form to edit an existing movie" do
    get :edit, { id: movies(:titanic).id}
    assert_response :success
    assert_template 'movies/edit'
    assert_template partial: '_form', count: 1

    movie = assigns(:movie)
    assert_not_nil movie
    assert_not_nil movie.name
  end

  test "should update an existing movie with valid new inputs" do
    movie = movies(:titanic)

    assert_no_difference('Movie.count') do
      patch :update, id: movie.id, movie: { name: "Hello Billy" }
    end

    assert movie.reload
    assert_equal "Hello Billy", movie.name

    assert_redirected_to movie_path(movie.id)
    assert_response :redirect
  end

  test "cannot update a movie without valid inputs and will render the 'edit' form" do
    movie = movies(:titanic)

    assert_no_difference('Movie.count') do
      patch :update, id: movie.id, movie: { name: nil }
    end

    assert movie.reload
    assert_template :edit
    assert_response :success
  end

  test "should change the value of the 'ranked' data field when call the 'upvote' method" do
    movie = movies(:shawshank_redemption)
    patch :upvote, id: movie.id
    assert movie.save
    assert_redirected_to movie_path(movie.id)
    assert_response :redirect
  end

  test "can destroy a movie" do
    movie = movies(:shawshank_redemption)
    assert_difference('Movie.count', -1) do
      delete :destroy, id: movie.id
    end
    assert_redirected_to movies_path
    assert_response :redirect
  end
end
