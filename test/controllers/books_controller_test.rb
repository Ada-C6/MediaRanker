require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "index should show all the artists" do
      get :index
      assert_response :success
      assert_template :index
    end
end
