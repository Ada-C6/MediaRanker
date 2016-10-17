require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should display the #index view" do
    get :index
    assert_response :success
    assert_template :index
  end
end
