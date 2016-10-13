require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: books(:one).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, {movie: {title: "The Grand Budapest Hotel", year: 2014, synopsis: "I want to see it"}}
    assert_response :redirect
  end

  test "creating a movie changes the number of movies" do
    assert_difference("Movie.count", 1) do
      post :create, {movie: {title: "The Grand Budapest Hotel", year: 2014, synopsis: "On my list"}}
      assert_response :redirect
    end
  end

  test "should get edit" do
    get :edit, {id: movies(:one).id}
    assert_response :success
  end

  test "should get update" do
    patch :update, {id: movies(:two).id, movie: {title: "The Grand Budapest Hotel", year: 2014, synopsis: "On my list"}}
    assert_response :redirect
  end

  # test "should upvote" do
  #   patch :upvote
  #   assert_response :success
  # end
  #
  test "should get destroy" do
    delete :destroy, {id: movies(:one).id}
    assert_response :redirect
  end

  test "deleting a movie changes the number of movies" do
    assert_difference("Movie.count", -1) do
      delete :destroy, {id: movies(:one).id}
      assert_response :redirect
    end
  end

end
