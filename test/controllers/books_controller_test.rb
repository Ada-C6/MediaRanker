require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: books(:in_the_woods)}
    assert_response :success
  end

  test 'should not get show if resource DNE' do
    params = {id: 14678}
    assert_raises ArgumentError do
      get :show, params
    end

    params = {id: "are you a cat?"}
    assert_raises ArgumentError do
      get :show, params
    end

    params = {id: 100.0001}
    assert_raises ArgumentError do
      get :show, params
    end
  end

  test "should get edit" do
    get :edit, {id: books(:dreams)}
    assert_response :success
  end

  test 'should not get edit if resource DNE' do
    params = {id: "cat"}
    assert_raises ArgumentError do
      get :edit, params
    end

    params = {id: 2434}
    assert_raises ArgumentError do
      get :edit, params
    end

    params = {id: 0.000023434}
    assert_raises ArgumentError do
      get :edit, params
    end

  end

  test "should be able to update" do
    params = {id: books(:dreams),
            book: {name: books(:dreams)}}
    put :update, params
    assert_response :redirect
  end

  test 'should not be able to update something that does not exist' do
    params = {id: 232546544}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: :hello_its_me}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: "adele"}
    assert_raises ArgumentError do
      put :update, params
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create" do
    post :create, {book: {id: 1044,
                  name: "ediff biography",
                  creator: "christian brink",
                  description: "my husband is an author",
                  votes: 1000}}
    assert_response :redirect
  end

  test "should be able to destroy" do
    delete :destroy, {id: books(:in_the_woods)}
    assert_response :redirect
  end

  test 'should not be able to destroy something that does not exist' do
    params = {id: "barack obama"}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: 400.04}
    assert_raises ArgumentError do
      put :update, params
    end

    params = {id: 309}
    assert_raises ArgumentError do
      put :update, params
    end
  end

  # jeannie & melissa helped me with this. i did not do it myself.
  test "should be able to upvote" do
    assert_difference("Book.find(books(:dreams).id).votes", 1) do
      params = {id: books(:dreams)}
      @request.env['HTTP_REFERER'] = '/albums/index'
      post :upvote, params
    end
  end

end
