require 'test_helper'

class MediaControllerTest < ActionController::TestCase
  setup do
    @movie = media(:movie1)
    @ablum = media(:album1)
  end
  # index
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end



  # show
  test "should get show movie" do
    get :show, {id: @movie.id }
    assert_response :success
    assert_template :show_movie
  end

  test "should get show album" do
    get :show, {id: @ablum .id }
    assert_response :success
    assert_template :show_album
  end

  test "should return 404 if a movie is not found" do
    movie_id_that_does_not_exist = -1
    get :show, {id: movie_id_that_does_not_exist }
    assert_response :missing
  end

  # edit
  # Positive case
  test "should get edit" do
    get :edit, {id: @movie.id }
    assert_response :success
  end


  # update
  # Negative case
  test "should not update with nil name" do
    patch :update, {id: @movie.id, :movie => {} }
    assert_response 400
  end

  # Positive case
  test "should update name, director and description " do
    patch :update, { id: @movie, :movie => {name: @movie.name, director: @movie.director, description: @movie.description} }
    assert_response :redirect
  end

  # use find by to test update article itself?

  # delete
  test "should get delete" do
    get :delete, {id: @movie.id }
    assert_response :redirect
  end

  test "should destroy post" do
    assert_difference('Media.count', -1) do
      delete :destroy, id: @movie
    end
  assert_response :redirect
  # what happened when user delete something is not there?
end
  # upvote
  test "should get upvote" do
    assert_equal 2, media(:movie1).votes
    get :upvote, {id: media(:movie1).id }
    assert_response :redirect
    media(:movie1).reload
    assert_equal 3, media(:movie1).votes
  end

  # refer the upvote part to model test

  #  test type_to_model

end
