require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
    test "will show the albums index view and assign the albums instance variable" do
        get :index
        assert_response :success
        assert_template 'albums/index'

        albums = assigns(:albums)
        assert_not_nil albums
    end

    test "will get the new form for a new album" do
        get :new
        assert_response :success
        assert_template :new

        album = assigns(:album)
        assert_not_nil album
        assert_nil album.id
    end

    test "will add a new (named) album to the DB and redirect to album index page" do
        post_params = { album: { name: "yellow mellow" } }
        assert_difference('Album.count', 1) do
            post :create, post_params
        end

        assert_redirected_to albums_path
    end

    test "will not add a new (unnamed) album to the DB, instead will render the album new page" do
        post_params = { album: { description: "yo yo what's up?" } }
        assert_no_difference('Album.count', 1) do
            post :create, post_params
        end

        assert_template 'albums/new'
    end

    test "will show the requested album" do
        album_id = albums(:another_album).id
        get :show, { id: album_id }
        assert_response :success
        assert_template :show

        album = assigns(:album)
        assert_not_nil album
        assert_equal(album.id, album_id)
    end

    test "will get the edit form to edit an album" do
        album_id = albums(:another_album).id
        get :edit, { id: album_id }
        assert_response :success
        assert_template :edit

        album = assigns(:album)
        assert_not_nil album
        assert_not_nil album.id
    end
end
