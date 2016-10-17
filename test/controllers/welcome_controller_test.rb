require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "index should display movies, books, and albums" do
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'layouts/_media_list', count: 3


    movies = assigns(:movies)
    books  = assigns(:books)
    albums = assigns(:albums)

    assert_not_nil movies
    assert_not_nil books
    assert_not_nil albums
  end
end
