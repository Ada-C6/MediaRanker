require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index

    albums = assigns(:albums)

    assert_not_empty albums

  end


  test "should get show" do
    get :show, {id: albums(:one).id}
    assert_response :success
    assert_template :show

    album = assigns(:album)

    assert_not_nil(album)
    album_id = albums(:one).id
    assert_equal album_id, album.id

  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new

    album = assigns(:album)

    assert_not_nil(album)
    assert_not album.valid?
    album.title = "Test hi hello"
    assert album.valid?

  end

  test "Adds a new album to album database" do
    assert_difference('Album.count', 1) do
      post :create, { album: {title: "This album is for testing"} }
    end
    assert_response :redirect

    album1 = Album.new()
    assert_not album1.valid?
  end

  test "will get form to edit an existing album" do
    get :edit, {id: albums(:two).id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_form', count: 1

    album = assigns(:album)
    assert_not_nil(album)
    assert album.valid?

  end

  test "Should save updated album to database" do
    album = albums(:one)
    patch :update, { id: album.id, album: {title: "Wrath of Guinevere"} }

    assert_not_equal albums(:one).title, Album.find(album.id).title
    assert album.valid?
    assert_response :redirect

  end

  test "Should not update a album to have no title" do
    album = albums(:two)
    patch :update, { id: album.id, album: {title: "This title remains the same if I try to update it to an empty string"} }
    assert_equal Album.find(album.id).title, "This title remains the same if I try to update it to an empty string"

    patch :update, { id: album.id, album: {title: ""} }
    assert_equal Album.find(album.id).title, "This title remains the same if I try to update it to an empty string"
    assert_response :success

  end

  test "Should delete a record from the database" do
    album_id = albums(:three).id
    assert_difference('Album.count', -1) do
      delete :destroy, { id: album_id }
    end

    assert_response :redirect
  end
end
