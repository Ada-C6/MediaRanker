require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index

    books = assigns(:books)
    movies = assigns(:movies)
    albums = assigns(:albums)

    assert_not_nil books
    assert_not_nil movies
    assert_not_nil albums

  end

end
