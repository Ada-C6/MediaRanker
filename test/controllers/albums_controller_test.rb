require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "Should be able to bring up albums index page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "Should be able to show the page for a particular album if album exists" do
    # For an album that exists
    get :show, {id: albums(:one).id}
    assert_response :success
    assert_template :show

    # For an album that doesn't exist
    get :show, {id: -1}
    assert_response :missing
  end

  test "Should be able to show the page to create a new album" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "Should be able to create an album only if fields are correctly filled" do
    # Album with all fields completed - should be created and redirected
    post :create, { album: {title: "AlbumName", artist: "AlbumArtist", description: "AlbumDescription"}}
    assert_response :redirect

    # Album with a missing field - should render the new page again
    post :create, { album: {name: "AlbumName", description: "AlbumDescription"}}
    assert_response :error
    assert_template :new
  end

  test "The number of albums in the database should increment by one when an album is created" do
    # Album with full input data
    assert_difference('Album.count', 1) do
      post :create, { album: {title: "AlbumName1", artist: "AlbumArtist1", description: "AlbumDescription1"}}
    end

    # Album with a missing field - fails validation, should not cause an increase
    assert_difference('Album.count', 0) do
      post :create, { album: {title: "AlbumName1", description: "AlbumDescription1"}}
    end
  end


  test "Should be able to get the edit page for an album if the album exists" do
    # For album that exists
    get :edit, { id: albums(:one).id }
    assert_response :success
    assert_template :edit

    # For album that does not exist
    get :edit, { id: -1 }
    assert_response :missing
  end

  # https://garrickvanburen.com/passing-sessions-and-referers-in-rails-functional-tests/
  # But referer is apparently not reliable, so look for a more robust way to do this

  test "Should be able to patch an update (for upvote) if the record exists" do
    # From show page
    @request.env['HTTP_REFERER'] = '/show'
    patch :update, { id: albums(:one).id}
    assert_response :redirect

    # From index page
    @request.env['HTTP_REFERER'] = '/index'
    patch :update, { id: albums(:one).id}
    assert_response :redirect

    # Attempting to update a record that does not exist
    patch :update, { id: -1 }
    assert_response :missing
  end

  # I'm not sure why, but using the fixture directly - albums(:one).upvotes - will result in a
  # failing test and the appearance of no incrementation. The same is true for editing of apparently
  # field. My theory is that if there is a redirect in a test, the fixture may get reset as control
  # is returned back to the test. In any case, this feature actually does work, so I think the
  # Album.find(albums(:one).id) is a workaround that gives an accurate reflection of whether things
  # are working.

  test "Patching an update (for upvote) should result in an increase of 1 in the number of upvotes of a record" do
    assert_difference('Album.find(albums(:one).id).upvotes', 1) do
      @request.env['HTTP_REFERER'] = '/index'
      patch :update, { id: albums(:one).id }
    end
  end

  test "Should be able to put an update (for edit to album data)" do
    # Update good record with good info
    put :update, { id: albums(:one).id, album: { title: "MyAlbum1", artist: "MyArtist1", description: "MyDescription1" } }
    assert_response :redirect

    # Update good record with bad info
    put :update, { id: albums(:one).id, album: { title: "MyAlbum", artist: "", description: "MyDescription" } }
    assert_response :error
    assert_template :edit

    # Update non-existent record
    put :update, { id: -1, album: { title: "MyAlbum", artist: "MyArtist", description: "MyDescription" } }
    assert_response :missing
  end

  test "Putting an update (for edit to album data) should change the relevant album data as expected" do
    # Update good record with good info
    original_title = albums(:one).title
    put :update, { id: albums(:one).id, album: { title: "MyAlbum2", artist: "MyArtist2", description: "MyDescription2" } }
    assert_equal Album.find(albums(:one).id).title, "MyAlbum2"
    assert_equal Album.find(albums(:one).id).artist, "MyArtist2"
    assert_equal Album.find(albums(:one).id).description, "MyDescription2"
    assert_not_equal original_title, Album.find(albums(:one).id).title
  end

  test "Should be able to destroy an album if it exists" do
    # Destroying an album that exists
    get :destroy, { id: albums(:one).id }
    assert_response :redirect

    # Trying to destroy an album that does not exist
    get :destroy, { id: -1 }
    assert_response :missing
  end

  test "The number of albums in the database should decrement by one when an album is destroyed" do

    assert_difference('Album.count', -1) do
      get :destroy, { id: albums(:one).id }
    end

  end

end
