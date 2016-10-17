require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get the edit form for an existing movie to edit" do
    get :edit, { id: movies(:first).id }
    assert_response :success
    assert_template :edit
  end

  test "should create a new movie" do
    movie_params = { movie: { name: "Classics", director: "Many", description: "Many clasics", ranking: 5 }}
    post :create, movie_params
    assert_redirected_to movies_path
  end

  test "load show with given movie id" do
    get :show, { id: movies(:first).id }
    assert_response :success
    assert_template :show
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "can create a movie" do
    get :new
    assert_response :success

    movie_params = { movie: { name: "can create", director: "article", description: "successfully.", ranking: 12 } }
    post :create, movie_params
    assert_response :redirect
    # follow_redirect
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
  end
end
