require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  # called before every single test - makes sure we are
  # testing something not in our database
  # but from fixtures - we know it exists.
    setup do
      @album = albums(:Harry_and_the_Potters)
    end

    # called after every single test
    teardown do
      # when controller is using cache it may be a good idea to reset it afterwards
      Rails.cache.clear
    end

###### INDEX ######
  test "index should display albums" do
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'layouts/_index', count: 1

    albums = assigns(:albums)

    assert_not_nil albums
  end

  test "index should show all the albums" do
    get :index
    albums = assigns(:albums)

    assert_equal albums.count, Album.count
  end

  test "index displays the highest ranked album first" do
    get :index
    albums = assigns(:albums)

    #albums are ranked based on number of upvotes
    assert_operator albums.first.upvotes, :>=, albums.last.upvotes
  end


###### SHOW ######
  test "show should display a album" do
    get :show, { id: @album.id }
    assert_response :success
    assert_template :show
    assert_template partial: 'layouts/_show', count: 1

    album = assigns(:album)

    assert_not_nil album
  end


###### NEW ######
  test "new should get the new form for a new album" do
    get :new

    assert_response :success
    assert_template :new
    assert_template partial: 'layouts/_new', count: 1
    assert_template partial: 'layouts/_form', count: 1
  end

  test "new should not yet save the album" do
    get :new

    album = assigns(:album)
    assert_not_nil album
    assert_nil album.id
  end


###### CREATE ######
  test "Create adds a album to the database" do
    assert_difference('Album.count', 1) do
      post :create, album: { name: 'Test title', artist: 'Sarah Nahmias', description: 'A testy film' }
    end
  end

  test "Create should create a album with 0 upvotes" do
    post :create, album: { name: 'Test title 0', artist: 'Sarah Nahmias', description: 'A testy album' }

    added_album = Album.last
    assert_equal 0, added_album.upvotes
  end

  test "Create redirect us to the new album's show page" do
    post :create, album: { name: 'Show me the Test title', artist: 'Sarah Nahmias', description: 'A testy album' }

    added_album = Album.last
    assert_redirected_to album_path(added_album)
  end


###### EDIT ######
    test "Edit should get the form for updating specific album" do
      get :edit, { id: @album.id }

      assert_response :success
      assert_template :edit
      assert_template partial: 'layouts/_edit', count: 1
      assert_template partial: 'layouts/_form', count: 1

      album = assigns(:album)
      assert_not_nil album
    end


###### UPDATE ######
    test "Update does not add a album to the database" do
      assert_no_difference('Album.count') do
        patch :update, { id: @album.id, album: { name: 'Update Harry Potter' } }
      end
    end

    test "should update album" do
    patch :update, { id: @album.id, album: { name: 'Updated' } }

    # Reload association to fetch updated data and assert that title is updated.
    @album.reload
    assert_equal "Updated", @album.name
    end

    test "should redirect to album's show page" do
    patch :update,  { id: @album.id, album: { name: 'Updated2' } }

    assert_redirected_to album_path(@album)
    end


###### UPVOTE ######
  test "Upvoting a album adds 1 to its upvotes" do
    assert_difference("Album.find(@album.id).upvotes", 1) do
      patch :upvote, { id: @album.id }
    end
  end


###### DESTROY ######
  test "Destroy removes a album from the database" do
    assert_difference('Album.count', -1) do
      delete :destroy, { id: @album.id }
    end
  end

  test "Destroy redirects us to the albums index page" do
    delete :destroy, { id: @album.id }

    assert_redirected_to albums_path
  end

end
