require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  # called before every single test - makes sure we are
  # testing something not in our database
  # but from fixtures - we know it exists.
    setup do
      @movie = movies(:Harry_Potter)
    end

    # called after every single test
    teardown do
      # when controller is using cache it may be a good idea to reset it afterwards
      Rails.cache.clear
    end

###### INDEX ######
  test "index should display movies" do
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'layouts/_index', count: 1

    movies = assigns(:movies)

    assert_not_nil movies
  end

  test "index should show all the movies" do
    get :index
    movies = assigns(:movies)

    assert_equal movies.count, Movie.count
  end

  test "index displays the highest ranked movie first" do
    get :index
    movies = assigns(:movies)

    #movies are ranked based on number of upvotes
    assert_operator movies.first.upvotes, :>=, movies.last.upvotes
  end


###### SHOW ######
  test "show should display a movie" do
    get :show, { id: @movie.id }
    assert_response :success
    assert_template :show
    assert_template partial: 'layouts/_show', count: 1

    movie = assigns(:movie)

    assert_not_nil movie
  end


###### NEW ######
  test "new should get the new form for a new movie" do
    get :new

    assert_response :success
    assert_template :new
    assert_template partial: 'layouts/_new', count: 1
    assert_template partial: 'layouts/_form', count: 1
  end

  test "new should not yet save the movie" do
    get :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end


###### CREATE ######
  test "Create adds a movie to the database" do
    assert_difference('Movie.count', 1) do
      post :create, movie: { name: 'Test title', director: 'Sarah Nahmias', description: 'A testy film' }
    end
  end

  test "Create should create a movie with 0 upvotes" do
    post :create, movie: { name: 'Test title 0', director: 'Sarah Nahmias', description: 'A testy film' }

    added_movie = Movie.last
    assert_equal 0, added_movie.upvotes
  end

  test "Create redirect us to the new movie's show page" do
    post :create, movie: { name: 'Show me the Test title', director: 'Sarah Nahmias', description: 'A testy film' }

    added_movie = Movie.last
    assert_redirected_to movie_path(added_movie)
  end


###### EDIT ######
    test "Edit should get the form for updating specific movie" do
      get :edit, { id: @movie.id }

      assert_response :success
      assert_template :edit
      assert_template partial: 'layouts/_edit', count: 1
      assert_template partial: 'layouts/_form', count: 1

      movie = assigns(:movie)
      assert_not_nil movie
    end


###### UPDATE ######
    test "Update does not add a movie to the database" do
      assert_no_difference('Movie.count') do
        patch :update, { id: @movie.id, movie: { name: 'Update Harry Potter' } }
      end
    end

    test "should update movie" do
    patch :update, { id: @movie.id, movie: { name: 'Updated' } }

    # Reload association to fetch updated data and assert that title is updated.
    @movie.reload
    assert_equal "Updated", @movie.name
    end

    test "should redirect to movie's show page" do
    patch :update,  { id: @movie.id, movie: { name: 'Updated2' } }

    assert_redirected_to movie_path(@movie)
    end


###### UPVOTE ######
  test "Upvoting a movie adds 1 to its upvotes" do
    assert_difference("Movie.find(@movie.id).upvotes", 1) do
      patch :upvote, { id: @movie.id }
    end
  end


###### DESTROY ######
  test "Destroy removes a movie from the database" do
    assert_difference('Movie.count', -1) do
      delete :destroy, { id: @movie.id }
    end
  end

  test "Destroy redirects us to the movies index page" do
    delete :destroy, { id: @movie.id }

    assert_redirected_to movies_path
  end

end
