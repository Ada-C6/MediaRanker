require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
    test "will show the movies index view and assign the movies instance variable" do
        get :index
        assert_response :success
        assert_template 'movies/index'

        movies = assigns(:movies)
        assert_not_nil movies
    end

    test "will get the new form for a new movie" do
        get :new
        assert_response :success
        assert_template :new

        movie = assigns(:movie)
        assert_not_nil movie
        assert_nil movie.id
    end

    test "will add a new (named) movie to the DB and redirect to movie index page" do
        post_params = { movie: { name: "yellow mellow" } }
        assert_difference('Movie.count', 1) do
            post :create, post_params
        end

        assert_redirected_to movies_path
    end

    test "will not add a new (unnamed) movie to the DB, instead will render the movie new page" do
        post_params = { movie: { description: "yo yo what's up?" } }
        assert_no_difference('Movie.count', 1) do
            post :create, post_params
        end

        assert_template 'movies/new'
    end

    test "will show the requested movie" do
        movie_id = movies(:another_movie).id
        get :show, { id: movie_id }
        assert_response :success
        assert_template :show

        movie = assigns(:movie)
        assert_not_nil movie
        assert_equal(movie.id, movie_id)
    end

    test "will get the edit form to edit a movie" do
        movie_id = movies(:another_movie).id
        get :edit, { id: movie_id }
        assert_response :success
        assert_template :edit

        movie = assigns(:movie)
        assert_not_nil movie
        assert_not_nil movie.id
    end
end
