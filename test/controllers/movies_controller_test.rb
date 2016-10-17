require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should display the #index view" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get the #new form" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "load #show with given movie" do
    get :show, { id: movies(:one).id }
    assert_response :success
    assert_template :show
  end

  test "#show should 404 if trying to show an movie that doesn't exist" do
    movie_id = 12345
    # Artist ID shouldn't exist in the database, otherwise this test is invalid.
    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(movie_id)
    end

    get :show, { id: movie_id }

    assert_response :not_found
  end

  test "#create should render the new page with errors if any of the required fields are missing" do
    movie_params = { movie: {title: "a title", director: "bad wolves"}}
    post :create, movie_params
    assert_template :new
  end

  test "should create an movie with valid data" do
    movie_params = { movie: { title: "Grace", director: "Hopper", description: "She's the bomb." }}
    post :create, movie_params
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should render the edit page" do
    get :edit, { id: movies(:one).id }
    assert_response :success
    assert_template :edit
  end

  test "should update an movie with valid data" do
    # I struggled with this one for a bit, trying to figure out how to pass both the movie id and the movie's parameters to the update call. Somehow, I stumbled on http://stackoverflow.com/questions/13150272/meaning-for-attributes-for-in-factorygirl-and-rspec-testing and figured out that movie.attributes would give me the hash of data I needed.
    movie = movies(:two)
    movie.description = "I updated this description"
    patch :update, { id: movies(:two).id, movie: movie.attributes }
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should render the edit page if try to update an movie with invalid data" do
    movie = movies(:three)
    movie.description = nil
    patch :update, { id: movies(:three).id, movie: movie.attributes }
    assert_template :edit
  end

  test "should destroy an movie" do
    delete :destroy, { id: movies(:four) }
    assert_response :redirect
    assert_redirected_to movies_path
  end

  test "#upvote should add one to the rank of the given item" do
    # I wrote my upvote method to redirect to the page that the upvote was called from, so I need to make a fake page in my test in order to have the method work. I'm going to pretend that this test is coming from the root.
    session[:return_to] = root_path
    movie = movies(:five)
    before_votes = movie.rank

    patch :upvote, { id: movie.id }

    after_movie = Movie.find(movies(:five).id)

    assert_equal after_movie.rank, before_votes + 1
    assert_redirected_to root_path
  end
end
