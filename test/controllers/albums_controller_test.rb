require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
#INDEX:
  test "should go to the index" do
    get :index

    assert_response :success
    assert_template :index
  end

  test "should display the correct array of albums" do
    albums = albums(:cut_copy, :lcd_soundsystem, :digitalism)
    get :index

    assert_equal(assigns(:albums_by_rank), albums(:lcd_soundsystem, :digitalism, :cut_copy))
  end

  test "should go to albums#show page when you click on a album title" do
    get :show, { id: albums(:cut_copy).id }

    assert_response :success
    assert_template :show
  end

  # add/create
  test "should go to Albums#new when you click on Add a Album" do
    get :new

    assert_response :success
    assert_template :new
  end

  test "should create a album when you click on Add a Album with a name" do
    post_params = { album: { name: "Brazil", artist: "South American Writers"} }

    assert_difference('Album.count', 1) do
      post :create, post_params
    end

    assert_redirected_to Album.last
  end

  test "cannot add a new album to the DB if validations aren't met" do
    post_params = { album: { director: "James"} }

    assert_no_difference('Album.count', 1) do
      post :create, post_params
    end

    assert_template(:new)
  end

  # edit/update
  test "should go to Albums#edit when you click on Edit" do
    album = albums(:cut_copy)
    get :edit, { id: album.id }

    assert_response :success
    assert_template :edit
  end

  test "should update a album" do
    album = albums(:cut_copy)
    updated_artist = "Updated"

    put :update, id: album.id, album: { artist: updated_artist }
    assert_redirected_to album_path(assigns(:album))

    album.reload
    assert_equal updated_artist, album.artist
  end

  # delete
  test "should delete album when you click on Delete" do
    album = albums(:cut_copy)
    assert_difference('Album.count', -1) do
      delete :destroy, { id: album.id }
    end

    assert_redirected_to albums_path
  end

  #upvote\
  test "should upvote a album when you click on Upvote" do
    album = albums(:lcd_soundsystem)

    setup do
      @request.env['HTTP_REFERER'] = 'http://localhost:3000/albums'
      patch :upvote, id: album.id, album: { }
      # assert_redirected_to albums_path
      album.reload
      assert_equal 8, album.rank
    end
  end
end
