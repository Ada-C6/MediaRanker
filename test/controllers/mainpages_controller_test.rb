require 'test_helper'

class MainpagesControllerTest < ActionController::TestCase
  test "index should get all the albums" do
    all_albums = assigns(:albums)
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil albums
  end
  test "index should get all the books" do
    all_books = assigns(:books)
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil books
  end
  test "index should get all the movies" do
    all_movies = assigns(:movies)
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil movies
  end
end
