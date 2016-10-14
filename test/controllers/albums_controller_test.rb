require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  ### INDEX ###
  test "Index should display correctly" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "Index should populate all the records of albums" do
    get :index

    assert_equal assigns(:albums).count, Album.count
  end

  ### CREATE ###

  ### NEW ###

  ### EDIT ###

  ### SHOW ###

  ### UPDATE ###

  ### DESTROY ###

  ### VOTE ###

end
