require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "Should be able to bring up movies index page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "Should be able to show the page for a particular movie if movie exists" do
    # For an movie that exists
    get :show, {id: movies(:one).id}
    assert_response :success
    assert_template :show

    # For an movie that doesn't exist
    get :show, {id: -1}
    assert_response :missing
  end

  test "Should be able to show the page to create a new movie" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "Should be able to create an movie only if fields are correctly filled" do
    # Movie with all fields completed - should be created, and user redirected to the movie's show page
    post :create, { movie: {title: "MovieName", director: "MovieDirector", description: "MovieDescription"}}
    assert_response :redirect
    assert_redirected_to movies_show_path(Movie.last)

    # Movie with a missing field - should render the new page again
    post :create, { movie: {name: "MovieName", description: "MovieDescription"}}
    assert_response :error
    assert_template :new
  end

  test "The number of movies in the database should increment by one when an movie is created" do
    # Movie with full input data
    assert_difference('Movie.count', 1) do
      post :create, { movie: {title: "MovieName1", director: "MovieDirector1", description: "MovieDescription1"}}
    end

    # Movie with a missing field - fails validation, should not cause an increase
    assert_difference('Movie.count', 0) do
      post :create, { movie: {title: "MovieName1", description: "MovieDescription1"}}
    end
  end


  test "Should be able to get the edit page for an movie if the movie exists" do
    # For movie that exists
    get :edit, { id: movies(:one).id }
    assert_response :success
    assert_template :edit

    # For movie that does not exist
    get :edit, { id: -1 }
    assert_response :missing
  end

  # https://garrickvanburen.com/passing-sessions-and-referers-in-rails-functional-tests/
  # But referer is apparently not reliable, so look for a more robust way to do this

  test "Should be able to patch an update (for upvote) if the record exists" do
    # If referer is nil, default behavior should be redirect to index
    patch :update, { id: movies(:one).id}
    assert_response :redirect
    assert_redirected_to movies_index_path

    # From show page
    @request.env['HTTP_REFERER'] = '/show'
    patch :update, { id: movies(:one).id}
    assert_response :redirect
    assert_redirected_to movies_show_path(movies(:one).id)

    # From index page
    @request.env['HTTP_REFERER'] = '/index'
    patch :update, { id: movies(:one).id}
    assert_response :redirect
    assert_redirected_to movies_index_path

    # Attempting to update a record that does not exist
    patch :update, { id: -1 }
    assert_response :missing
  end

  test "Patching an update (for upvote) should result in an increase of 1 in the number of upvotes of a record" do
    assert_difference('movies(:one).upvotes', 1) do
      @request.env['HTTP_REFERER'] = '/index'
      patch :update, { id: movies(:one).id }
      movies(:one).reload
    end
  end

  test "Should be able to put an update (for edit to movie data)" do
    # Update good record with good info
    put :update, { id: movies(:one).id, movie: { title: "MyMovie1", director: "MyDirector1", description: "MyDescription1" } }
    assert_response :redirect
    assert_redirected_to movies_show_path(movies(:one).id)

    # Update good record with bad info
    put :update, { id: movies(:one).id, movie: { title: "MyMovie", director: "", description: "MyDescription" } }
    assert_response :error
    assert_template :edit

    # Update non-existent record
    put :update, { id: -1, movie: { title: "MyMovie", director: "MyDirector", description: "MyDescription" } }
    assert_response :missing
  end

  test "Putting an update (for edit to movie data) should change the relevant movie data as expected" do
    # Update good record with good info
    original_title = movies(:one).title
    put :update, { id: movies(:one).id, movie: { title: "MyMovie2", director: "MyDirector2", description: "MyDescription2" } }
    movies(:one).reload

    assert_equal movies(:one).title, "MyMovie2"
    assert_equal movies(:one).director, "MyDirector2"
    assert_equal movies(:one).description, "MyDescription2"
    assert_not_equal original_title, movies(:one).title
  end

  test "Should be able to destroy an movie if it exists" do
    # Destroying an movie that exists
    get :destroy, { id: movies(:one).id }
    assert_response :redirect
    assert_redirected_to movies_index_path

    # Trying to destroy an movie that does not exist
    get :destroy, { id: -1 }
    assert_response :missing
  end

  test "The number of movies in the database should decrement by one when an movie is destroyed" do

    assert_difference('Movie.count', -1) do
      get :destroy, { id: movies(:one).id }
    end

  end

end
