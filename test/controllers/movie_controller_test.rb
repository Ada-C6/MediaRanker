require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get the entire list of movies" do
    # Should populate an array of movies
    # should render the :index view
    movie = movies(:nightmare)
    bad_movie = albums(:sample)
    get :index

    assert_response :success
    assert_template :index

    movies = assigns(:full_list)
    assert_not_empty(movies)
    assert_includes(movies, movie)
    assert_not_includes(movies, bad_movie)
  end

  #SHOW

  test "should show details of movie" do
    movie_id = movies(:nightmare).id

    get :show, {id: movie_id}

    assert_response :success
    assert_template :show

    movie = assigns(:this_item)
    assert_not_nil movie
    assert_equal movie_id, movie.id
  end

  test "show a non_extant movie" do
    movie_id = Movie.last.id + 1

    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(movie_id)
    end

  end

  #NEW
  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    item = assigns( :new_item)
    assert_not_nil item
    assert_nil item.id
  end

  # CREATE
  test "should add a new movie to the DB" do

    post_params = { movie: { name: "Devil wears Prada", director: "no clue", description: "Meryl Strepe(?) and Anne Hathaway"} }

    assert_difference('Movie.count', 1) do
      post :create, post_params
    end

    assert_redirected_to movies_path
  end

  #EDIT
  test "should get the form of a movie to edit" do
    get :edit, id: movies(:nightmare).id
    assert_response :success
    assert_template :edit
  end

  #UPDATE
  test "should update the movie" do
    movie_params = {name: "Edit", director: "Sucessfully", description: "Please."}

    patch :update, :id => movies(:nightmare).id, movie:  movie_params
    assert_redirected_to show_movie_path(movies(:nightmare).id)

  end

  #DESTROY
  test "should destroy entry" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: movies(:nightmare).id
    end

    assert_redirected_to movies_path
  end

  # test "should increase the rank by 1" do
  #   movie = movies(:nightmare)
  #   assert_difference(movie.rank) do
  #     patch :vote, :id => movie.id
  #   end
  # end

    # patch :vote, :id => movies(:nightmare).id, movie: {vote: true}

    # movie = Movie.create!(name: "Please", director: "add", description: "one")
    # movie.rank = 10
    # one = movie.rank.to_i
    # puts "Movie #{movie.attributes}"
    # puts "One #{one}"
    #
    #
    # patch :vote, :id => movie.id

    # puts movie.rank
    # two = Movie.find(movies(:nightmare).id).rank
    # puts two
    #
    # assert_equal(one + 1, two)

  # end

end
