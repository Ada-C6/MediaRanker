require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index

    movies = assigns(:movies)

    assert_not_empty movies

  end


  test "should get show" do
    get :show, {id: movies(:one).id}
    assert_response :success
    assert_template :show

    movie = assigns(:movie)

    assert_not_nil(movie)
    movie_id = movies(:one).id
    assert_equal movie_id, movie.id

  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)

    assert_not_nil(movie)
    assert_not movie.valid?
    movie.title = "Test hi hello"
    assert movie.valid?

  end

  test "Adds a new movie to movie database" do
    assert_difference('Movie.count', 1) do
      post :create, { movie: {title: "This movie is for testing"} }
    end
    assert_response :redirect

    movie1 = Movie.new()
    assert_not movie1.valid?
  end

  test "will get form to edit an existing movie" do
    get :edit, {id: movies(:two).id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_form', count: 1

    movie = assigns(:movie)
    assert_not_nil(movie)
    assert movie.valid?

  end

  test "Should save updated movie to database" do
    movie = movies(:one)
    patch :update, { id: movie.id, movie: {title: "Wrath of Guinevere"} }

    assert_not_equal movies(:one).title, Movie.find(movie.id).title
    assert movie.valid?
    assert_response :redirect

  end

  test "Should not update a movie to have no title" do
    movie = movies(:two)
    patch :update, { id: movie.id, movie: {title: "This title remains the same if I try to update it to an empty string"} }
    assert_equal Movie.find(movie.id).title, "This title remains the same if I try to update it to an empty string"

    patch :update, { id: movie.id, movie: {title: ""} }
    assert_equal Movie.find(movie.id).title, "This title remains the same if I try to update it to an empty string"
    assert_response :success

  end

  test "Should delete a record from the database" do
    movie_id = movies(:three).id
    assert_difference('Movie.count', -1) do
      delete :destroy, { id: movie_id }
    end

    assert_response :redirect
  end

end
