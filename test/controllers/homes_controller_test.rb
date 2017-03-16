require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  test "should show home page and lists" do
    get :index
    assert_response :success
  end

end
