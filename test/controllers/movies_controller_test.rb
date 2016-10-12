require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show movie" do
    get :show, {id: movies(:mean_girls).id}
    assert_response :success
    assert_template :show
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should be able to create a new movie" do
    post_params = {movie: {title: "Mr. Popper's Penguins", director: "No idea", genre: "Children", description: "penguins!", rank: 40}}
    post :create, post_params
    assert_redirected_to controller: "movies", action: "index"
  end

  test "creating a movie changes the number of movies" do
    assert_difference("Movie.count",1) do
      post_params = {movie: {title: "Mr. Popper's Penguins", director: "No idea", genre: "Children", description: "penguins!", rank: 40}}
      post :create, post_params
    end
  end

  test "should get edit" do
    get :edit, {id: movies(:mean_girls).id}
    assert_response :success
  end

  test "should be able to update a movie" do
    put :update, {id: movies(:mean_girls).id, movie: {title: "Mr. Popper's Penguins", director: "No idea", genre: "Children", description: "penguins!", rank: 40}}
    assert_redirected_to controller: "movies", action: "show"
  end

  test "should be able to upvote a movie" do
    patch :upvote, {id: movies(:mean_girls).id}
    assert_redirected_to controller: "movies", action: "show"
  end
  test "should be able to downvote a movie" do
    patch :downvote, {id: movies(:mean_girls).id}
    assert_redirected_to controller: "movies", action: "show"
  end

  test "should be able to delete a movie" do
    delete :destroy, {id: movies(:mean_girls).id}
    assert_redirected_to controller: "movies", action: "index"
  end

  test "deleting a movie changes the number of movies" do
    assert_difference("Movie.count", -1) do
      delete :destroy, {id: movies(:mean_girls).id }
    end
  end

end
