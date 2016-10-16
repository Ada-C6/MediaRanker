require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test "should display home page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "shows up to ten of top ranked title in each category" do
    get :index
    assert_not_nil assigns(:movies)
    assert_not_nil assigns(:books)
    assert_not_nil assigns(:albums)
  end

end
