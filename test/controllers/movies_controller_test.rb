require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: movies(:dead_or_alive) }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: movies(:dead_or_alive) }
    assert_response :success
  end

  test "should be able to create a movie" do
    post_params = {movie:{name: "Sensory Overload", director: "Your mom"}}
    post :create, post_params
    assert_response :redirect
  end

  test "Creating a movie changes the number of movies" do
    assert_difference("Movie.count",1) do 
       post_params = {movie:{name: "Sensory Overload", director: "Your mom"}}
       post :create, post_params
    end
  end

  test "should be able to update a movie" do
    update_params = {movie:{name: movies(:dead_or_alive).name, director: movies(:dead_or_alive).director}, id: movies(:dead_or_alive).id}
    put :update , update_params
    assert_response :redirect
  end

  test "should be able to delete a movie" do
    assert_difference("Movie.count",-1) do 
      delete :destroy, {id: movies(:dead_or_alive).id}
      assert_response :redirect
    end
  end

  test "can't delete a movie that is not there" do
    assert_difference("Movie.count",0) do 
      delete :destroy, {id: 400}
    end
  end

  test "should be able to upvote a movie" do
         #fake page for page page to come from
        request.env["HTTP_REFERER"]="blah"
        upvote_params = {movie:{name: movies(:dead_or_alive).name, director: movies(:dead_or_alive).director}, id: movies(:dead_or_alive).id}
        patch :upvote, upvote_params
        assert_redirected_to("blah")
  end
  
  test "should be able to downvote a movie" do
         #fake page for page page to come from
        request.env["HTTP_REFERER"]="blah"
        upvote_params = {movie:{name: movies(:dead_or_alive).name, director: movies(:dead_or_alive).director}, id: movies(:dead_or_alive).id}
        patch :downvote, upvote_params
        assert_redirected_to("blah")
  end
end
