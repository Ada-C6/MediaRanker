require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create" do
    post_params = {movie: {title:"Jaws"}}
    post :create, post_params
    assert_response :redirect
  end

  test 'creating movie changes the number of movies' do
    assert_difference "Movie.count", 1 do
      post :create, {movie: {title: "Jaws", creator: "Stevie Spellberg", description:"So good"}}
        assert_response :redirect
    end
  end
  test "should get edit" do
    get :edit, {id: 1}
    assert_response :success
  end

  test "should be able update a movie" do
    patch :update, {id: movies(:one).id, movie: {title: "Jaws", creator: "Stevie Spellberg", description:"So So good"}}
    assert_response :redirect
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: 1}
    assert_response :success
  end

  test "should be able to delete" do
    delete :destroy, {id: 1}
    assert_response :redirect
  end

  test "deleting a movie changes the number of movies" do
    assert_difference("Movie.count", -1) do
      delete :destroy, {id: movies(:one).id}
      assert_response :redirect
    end
  end

  # test "deleting a book that isn't in the database" do
  #   delete :destroy, {id: books(:two).id}
  #   assert_no_difference("Book.count") do
  #     delete :destroy, {id: books(:two).id}
  #
  #     assert_response :redirect
  #   end
  # end

  end
