require 'test_helper'

class HomesControllerTest < ActionController::TestCase

  # INDEX
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

end
