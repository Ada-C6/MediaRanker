require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: movies(:inception).id}
    assert_response :success
    assert_template :show

    assert_equal assigns(:movie), movies(:inception)
  end

  test "should get edit" do
    get :edit, {id: movies(:inception).id}
    assert_response :success
    assert_template :edit

    assert_equal assigns(:movie), movies(:inception)
    assert_equal assigns(:movie).directed_by, "Christopher Nolan"

    assert_template partial: '_movieform', count: 1
  end

  test "should be able to update" do
    patch :update, :id => movies(:inception), :movie => {:name => 'Inceptionne'}
    assert_equal "Inceptionne", assigns(:movie).name
    assert_response :success
    assert_template :edit
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id

    assert_template partial: '_movieform', count: 1
  end

  test "should be able to create an movie" do
    post_params = {movie: {name: "Batman"}}
    post :create, post_params
    assert_response :success
    assert_template :new
  end

  test "creating an movie changes the number of movies" do
  assert_difference("Movie.count", 1) do
    post_params = {movie: {name: "Batman", directed_by: "Christopher Nolan", description: "Good stuff."}}
    post :create, post_params
  end
end

  test "should be able to delete an movie" do
    delete :destroy, {id: movies(:inception).id}
    assert_response :redirect
    assert_redirected_to movies_path
  end

  test "deleting an movie changes the number of movies" do
    assert_difference("Movie.count", -1) do
      delete :destroy, {id: movies(:inception).id}
      assert_response :redirect
    end
  end

  test "should be able to use upvote method to increase rating on movie" do
    assert_difference("Movie.find(movies(:inception).id).ranked", 1) do
      put :upvote, {id: movies(:inception).id}
    end
  end

end
