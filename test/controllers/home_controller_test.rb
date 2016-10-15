require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "(index) should get the home index page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "(index) should have all of the movies, books, and albums records" do
    get :index
    assert_response :success
    movies = assigns(:movies)
    books = assigns(:books)
    albums = assigns(:albums)

    assert assigns(:movies)
    assert_not_nil movies
    assert_not_empty movies

    assert assigns(:books)
    assert_not_nil books
    assert_not_empty books

    assert assigns(:albums)
    assert_not_nil albums
    assert_not_empty albums
  end
end
