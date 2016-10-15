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

  test "add a new album to the database (create action)" do
  assert_difference('Album.count', 1) do
    post_params = { album: { name: "haha and then what ;)", artist: "Jawbreaker Reunion" } }
    post :create, post_params
  end

  assert_redirected_to album_path(Album.last) #should redirect to the newly made album that was added to the database
end

 #  test "should show the requested album" do
 #   get :show, { id: albums(:two).id }
 #   assert_response :success
 #   assert_template :show
 #
 #   assert_equal assigns(:album), albums(:two)
 # end
end
