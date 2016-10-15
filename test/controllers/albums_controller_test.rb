require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get the new partial form for adding a album" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: '_form'

   album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end
end
