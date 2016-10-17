require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  test "(new) should get the album new form page" do
     get :new
     assert_response :success
     assert_template :new
     assert_template partial: 'partial/_form', count: 1
     album = assigns(:album)
     assert_not_nil album
     assert_nil album.id
   end

   #create album
  test "should create album" do
    assert_difference('Album.count', 1) do
    params = {
      album: {
        name: "album 1",
        artist: "artist1",
        description: "description 1"
     } }
     post :create, params
     end
    assert_redirected_to album_path(assigns(:album).id)
  end


   test "get new with new album" do
    new_data = albums(:valid_data)
    get :new, {}, { album_id: new_data.id }
    album = assigns(:album)
    assert album.new_record?
    assert_response :success
  end

  # or
  test "should get new with new album" do
    get :new
    album = assigns(:album)
    assert album.new_record?
    assert_response :success
  end

  test "(edit) should get the album edit form page" do
    album_id= albums(:valid_data).id
    assert_difference('Album.count', 0) do
      get :edit, {id: album_id}
      assert_response :success
      assert_template :edit
      assert_template partial: 'partial/_form', count: 1
      album = assigns(:album)
      assert_not_nil album
      assert_equal album.id, album_id
    end
  end

  test "should update album" do
    album_id= albums(:valid_data).id
    assert_difference('Album.count', 0) do
      patch :update, id: album_id , album: { name: "name", discription: "discription" }
    end
    assert_redirected_to album_path(album_id)
  end

  test "show the requested album" do
    album_id= albums(:valid_data).id
    get :show, { id: album_id }
    assert_response :success
    assert_template :show
    assert_template partial: 'partial/_show', count: 1
    album = assigns(:album)
    assert_not_nil album
    assert_equal album.id, album_id
  end
  
  test "index should get all the albums" do
    all_albums = assigns(:albums)
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'partial/_index', count: 1
    assert_not_nil albums
  end

  test "should destroy album" do
    album_id= albums(:valid_data).id
    assert_difference('Album.count', -1) do
      delete :destroy, id: album_id
    end
    assert_redirected_to albums_path
  end
end
