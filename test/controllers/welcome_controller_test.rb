require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success

  end

  test "index should display movies, books, and albums" do
    get :index
    assert_response :success

    movies = assigns(:movies)
    books  = assigns(:books)
    albums = assigns(:albums)

    assert_not_nil movies
    assert_not_nil books
    assert_not_nil albums
  end
end
