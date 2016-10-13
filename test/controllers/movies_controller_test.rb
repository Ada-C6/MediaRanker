require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: books(:one).id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, { movie: {title: "The Grand Budapest Hotel", year: 2014, synopsis: "I want to see it"} }
    assert_response :redirect
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   patch :update
  #   assert_response :success
  # end
  #
  # test "should upvote" do
  #   patch :upvote
  #   assert_response :success
  # end
  #
  # test "should get destroy" do
  #   delete :destroy
  #   assert_response :success
  # end

end
