require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should show list of movies" do
    get :index
    assert_response :success
  end

  test "should show specified movie" do
    get :show, {id: movies(:aladdin).id}
    assert_response :success
  end

  test "should show new movie form" do
    get :new
    assert_response :success
  end

  test "should create new movie" do
    assert_difference("Movie.count", 1) do
      post :create, {movie: {name: "Wow"}}
    end
    assert_response :redirect
  end

  test "should show movie edit form" do
    get :edit, {id: movies(:aladdin).id}
    assert_response :success
  end

  test "should update movie information correctly" do
    put :update, id: movies(:mulan), movie: {name: "Mulan", director: "fix director", description: "When will my reflection show?"}
    movie = Movie.find_by(name: "Mulan")

    assert_equal "fix director", movie.director
    assert_response :redirect
  end

  test "should delete movie" do
    assert_difference("Movie.count", -1) do
      delete :destroy, {id: movies(:aladdin).id}
    end
    assert_response :redirect
  end

  test "should update movie information with rank" do
    put :upvote, {id: movies(:aladdin).id}
    assert_response :redirect
  end

end
