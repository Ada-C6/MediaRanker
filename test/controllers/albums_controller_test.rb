require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

end
