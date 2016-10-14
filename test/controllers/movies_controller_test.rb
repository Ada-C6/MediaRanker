require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: 1}
    assert_response :success
  end

  test "should get 404 for record that does not exist" do
    delete :destroy, {id: 1 }
    get :show, {id: 1}
    assert_response :missing
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create an entity" do
    assert_difference('Movie.count', 1) do
      post_params = { movie: { title: "Movie Title", director: "Grace Hopper", description: "Great movie on computers!"}}
      post :create, post_params
    end
    assert_response :redirect
  end
  #
  test "should get edit" do
    get :edit, {id: 1}
    assert_response :success
  end

test "should be able to update" do
    put :update, :id => movies(:one), :movie => {:title => 'New Title', :director => "New Director", :description => "New Description"}
    assert_equal "New Title", Movie.find(movies(:one).id).title
  end

  test "should be able to delete" do
    delete :destroy, {id: 1 }
    assert_response :redirect
  end

  test "should be able to upvote" do
   assert_difference("Movie.find(movies(:one).id).rank", 1) do
     post_params = {id: movies(:one).id}
     @request.env['HTTP_REFERER'] = '/movies/index'
     post :upvote, post_params
   end
 end

end
