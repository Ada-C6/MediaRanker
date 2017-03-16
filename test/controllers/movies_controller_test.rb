require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: movies(:little_mermaid).id }
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    get :edit, {id: movies(:little_mermaid).id }
    assert_response :success
    assert_template :edit
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete a movie that exists and NOT flash a notification" do
    assert_includes(Movie.all, movies(:little_mermaid), "Yes that object exists." )
    delete :destroy, {id: movies(:little_mermaid).id }
    refute_equal flash[:notice], "That movie does not exist."
    assert_redirected_to :movies
    refute_includes(Movie.all, movies(:little_mermaid), "That object does not exist." )
  end


  test "deleting a movie should change the number of movies" do
    assert_difference("Movie.count", -1) do
    delete :destroy,  {id: movies(:little_mermaid).id }
    end
  end

  test "attempting to delete a movie that doesn't exist should flash a notification" do
    assert_includes(Movie.all, movies(:little_mermaid), "Yes that object exists." )
    delete :destroy, {id: movies(:little_mermaid).id }
    refute_includes(Movie.all, movies(:little_mermaid), "That object does not exist." )
    delete :destroy, {id: movies(:little_mermaid).id }
    assert_equal flash[:notice], "That movie does not exist."
    assert_redirected_to :movies
  end

  test "should create a movie" do
    params = {movie:{name: "Land Before Time", director: "Mr. Dinosaur", description: "A never-ending series about cute dinosaurs", votes: 0}}
    post :create, params
    assert_response :redirect
  end

  test "creating a movie should change the number of movies" do
    assert_difference("Movie.count", 1) do
    params = {movie:{name: "Land Before Time", director: "Mr. Dinosaur", description: "A never-ending series about cute dinosaurs", votes: 0}}
    post :create, params
    end
  end

  test "should update a movie" do
    movie_params = {id: movies(:little_mermaid).id, movie:{name: "Litte Mermaid!!!"}}
    patch :update, movie_params
    assert_response :redirect
  end

  test "should upvote a movie" do
    request.env["HTTP_REFERER"] = "where_i_came_from"
    post :up_vote,  {id: movies(:little_mermaid).id }
    assert_redirected_to("where_i_came_from")
  end

end
