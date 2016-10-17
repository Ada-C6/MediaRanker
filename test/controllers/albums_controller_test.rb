require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should go to the index page when requested" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  test "should show the requested album" do
    get :show, { id: albums(:pitch_perfect).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:album), albums(:pitch_perfect)
  end

  test "will add a valid new album to the DB" do
    post_params = { album: { title: "NEW album",
								 artist: "New artist", description: "Description of NEW album" } }
    assert_difference('Album.count', 1) do
      post :create, post_params
    end

    assert_redirected_to albums_path
  end

  test "won't add an invalid album" do
   post_params = { album: { artist: "FoobarGuy" } }
   assert_no_difference('Album.count') do
     post :create, post_params
   end
   assert_template :new
 end


 test "should get edit form" do
   id = albums(:glee_6).id
   get :edit, { id: id }
   assert_response :success
   assert_template :edit
 end

 test "should update the album" do
   id = albums(:the_way).id
   patch :update, {id: id, album: {title: "Updated The Way"} }
   assert_equal "Updated The Way", Album.find(id).title
   assert_redirected_to albums_path
 end

 test "destroy should delete the album" do
    id = albums(:music_box).id
    assert_difference("Album.count", -1) do
      delete :destroy, {id: id}
    end
    assert_raises ActiveRecord::RecordNotFound do
      Album.find(id)
    end
    assert_redirected_to albums_path
  end
end
