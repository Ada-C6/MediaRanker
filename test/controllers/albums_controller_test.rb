require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: albums(:the_voyager)}
    assert_response :success
  end

  test 'should not get show if resource DNE' do
    params = {id: 34923}
    assert_raises ArgumentError do
      get :show, params
    end

    params = {id: "vskeguhksefs"}
    assert_raises ArgumentError do
      get :show, params
    end

    params = {id: 3.141578}
    assert_raises ArgumentError do
      get :show, params
    end
  end

  test "should get edit" do
    get :edit, {id: albums(:the_long_way_round)}
    assert_response :success
  end

  test 'should not get edit if resource DNE' do
    params = {id: 34923}
    assert_raises ArgumentError do
      get :edit, params
    end

    params = {id: "vskeguhksefs"}
    assert_raises ArgumentError do
      get :edit, params
    end

    params = {id: 3.141578}
    assert_raises ArgumentError do
      get :edit, params
    end

  end

  test "should be able to update" do
    params = {id: albums(:the_long_way_round),
            album: {name: albums(:the_long_way_round)}}
    put :update, params
    assert_response :redirect
  end

  test 'should not be able to update something that does not exist' do
    params = {id: 34923}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: :cat}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: "cat"}
    assert_raises ArgumentError do
      put :update, params
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create" do
    post :create, {album: {id: 239343,
                  name: "purple rain",
                  creator: "prince",
                  description: "minnesota is the best",
                  votes: 0}}
    # puts purple_rain.errors
    assert_response :redirect
  end

  test "should be able to destroy" do
    delete :destroy, {id: albums(:the_long_way_round)}
    assert_response :redirect
  end

  test 'should not be able to destroy something that does not exist' do
    params = {id: "hello"}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: 349283.454253534}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: 40400034}
    assert_raises ArgumentError do
      put :update, params
    end
  end

  # jeannie & melissa helped me with this. i did not do it myself.
  test "should be able to upvote" do
    assert_difference("Album.find(albums(:the_voyager).id).votes", 1) do
      params = {id: albums(:the_voyager)}
      @request.env['HTTP_REFERER'] = '/albums/index'
      post :upvote, params
    end
  end

end
