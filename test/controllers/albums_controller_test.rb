require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @album  = albums(:to_pimp_a_butterfly)
  end

  test "should show the specific album" do
    get :show, { id: albums(:to_pimp_a_butterfly).id }
    assert_response :success
    assert_template :show
    assert_equal assigns(:album), albums(:to_pimp_a_butterfly)
  end

  test "should create a  album" do
    assert_difference('Album.count') do
      post :create, album: {title: @album.title, artist: @album.artist}
    end
    assert_redirected_to albums_path
  end

  test "should destroy a album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end
    assert_redirected_to albums_path
  end

  test "should get the new form for a new album" do
    get :new
    assert_response :success
    assert_template :new
    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album)
  end

  test "should update a album" do
    patch :update, id: @album, album: {title: @album.title, artist: @album.artist}
    assert_redirected_to album_path
  end

  test " should upvote a album" do
    assert_difference('Album.last.rank') do
      patch :upvote, {id: Album.last.id}
    end
  end

end
