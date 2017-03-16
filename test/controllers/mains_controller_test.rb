require 'test_helper'

class MainsControllerTest < ActionController::TestCase
  test "Should get index page for whole site" do
    get :index
    assert_response :success
    assert_template :index
  end

end
