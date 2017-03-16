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
    post :create, {movie: {name: "Wow"}}
    assert_response :redirect
  end

  test "should show movie edit form" do
    get :edit, {id: movies(:aladdin).id}
    assert_response :success
  end

  test "should update movie info" do
    put :update, {id: movies(:aladdin).id}
    assert_response :redirect
  end

  test "should delete movie" do
    delete :destroy, {id: movies(:aladdin).id}
    assert_response :redirect
  end

end
