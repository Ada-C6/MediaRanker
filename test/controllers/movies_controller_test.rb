require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: movies(:batman)}
    assert_response :success
  end

  test 'should not get show if resource DNE' do
    params = {id: 23349454}
    assert_raises ArgumentError do
      get :show, params
    end

    params = {id: "RIP heath ledger"}
    assert_raises ArgumentError do
      get :show, params
    end

    params = {id: 1.034}
    assert_raises ArgumentError do
      get :show, params
    end
  end

  test "should get edit" do
    get :edit, {id: movies(:catwoman)}
    assert_response :success
  end

  test 'should not get edit if resource DNE' do
    params = {id: "string"}
    assert_raises ArgumentError do
      get :edit, params
    end

    params = {id: 77777}
    assert_raises ArgumentError do
      get :edit, params
    end

    params = {id: 9.9}
    assert_raises ArgumentError do
      get :edit, params
    end

  end

  test "should be able to update" do
    params = {id: movies(:catwoman),
            movie: {name: "yo mama"}}
    put :update, params
    assert_response :redirect
  end

  test 'should not be able to update something that does not exist' do
    params = {id: 1222}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: :hello_its_me}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: "michelle obama"}
    assert_raises ArgumentError do
      put :update, params
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create" do
    post :create, {movie: {id: 234667,
                  name: "kirkland signature",
                  creator: "diane aves",
                  description: nil,
                  votes: 1000}}
    assert_response :redirect
  end

  test "should be able to destroy" do
    delete :destroy, {id: movies(:batman)}
    assert_response :redirect
  end

  test 'should not be able to destroy something that does not exist' do
    params = {id: "sasha & malia"}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: 1000.10}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: :ediff}
    assert_raises ArgumentError do
      put :update, params
    end
  end

  # jeannie & melissa helped me with this. i did not do it myself.
  test "should be able to upvote" do
    assert_difference("Movie.find(movies(:catwoman).id).votes", 1) do
      params = {id: movies(:catwoman).id}
      @request.env['HTTP_REFERER'] = '/movies/index'
      post :upvote, params
    end
  end
end
