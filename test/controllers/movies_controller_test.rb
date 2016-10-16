require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

#INDEX:
  test "should go to the index" do
    get :index

    assert_response :success
    assert_template :index
  end

  test "should display the correct array of movies" do
    movies = movies(:life_of_pi, :glue_sticks, :number_sequence, :jareds_life)
    get :index

    assert_equal(assigns(:movies_by_rank), movies(:life_of_pi, :jareds_life, :number_sequence, :glue_sticks))
  end

  test "should go to movies#show page when you click on a movie title" do
    get :show, { id: movies(:life_of_pi).id }

    assert_response :success
    assert_template :show
  end

# add/create
  test "should go to Movies#new when you click on Add a Movie" do
    get :new

    assert_response :success
    assert_template :new
  end

  test "should create a movie when you click on Add a Movie with a name" do
    post_params = { movie: { name: "Travel"} }

    assert_difference('Movie.count', 1) do
      post :create, post_params
    end

    assert_redirected_to Movie.last
  end

  test "cannot add a new movie to the DB if validations aren't met" do
    post_params = { movie: { director: "James"} }

    assert_no_difference('Movie.count', 1) do
      post :create, post_params
    end

    assert_template(:new)
  end

# edit/update
  test "should go to Movies#edit when you click on Edit" do
    movie = movies(:life_of_pi)
    get :edit, { id: movie.id }

    assert_response :success
    assert_template :edit
  end

  test "should update a movie" do
    movie = movies(:jareds_life)
    updated_director = "Updated"

    put :update, id: movie.id, movie: { director: updated_director }
    assert_redirected_to movie_path(assigns(:movie))

    movie.reload
    assert_equal updated_director, movie.director
  end

# delete
  test "should delete movie when you click on Delete" do
    movie = movies(:glue_sticks)
    assert_difference('Movie.count', -1) do
      delete :destroy, { id: movie.id }
    end

    assert_redirected_to movies_path
  end

#upvote\
  test "should upvote a movie when you click on Upvote" do
    movie = movies(:glue_sticks)

    setup do
      @request.env['HTTP_REFERER'] = 'http://localhost:3000/movies'
      patch :upvote, id: movie.id, movie: { }
      # assert_redirected_to movies_path
      movie.reload
      assert_equal 3, movie.rank
    end
  end

end
