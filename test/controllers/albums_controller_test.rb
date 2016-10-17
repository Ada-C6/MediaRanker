require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should display the #index view" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get the #new form" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "load #show with given album" do
    get :show, { id: albums(:one).id }
    assert_response :success
    assert_template :show
  end

  test "#show should 404 if trying to show an album that doesn't exist" do
    album_id = 12345
    # Artist ID shouldn't exist in the database, otherwise this test is invalid.
    assert_raises ActiveRecord::RecordNotFound do
      Album.find(album_id)
    end

    get :show, { id: album_id }

    assert_response :not_found
  end

  test "#create should render the new page with errors if any of the required fields are missing" do
    album_params = { album: {title: "a title", artist: "bad wolves"}}
    post :create, album_params
    assert_template :new
  end

  test "should create an album with valid data" do
    album_params = { album: { title: "Grace", artist: "Hopper", description: "She's the bomb." }}
    post :create, album_params
    assert_redirected_to album_path(assigns(:album))
  end

  test "should render the edit page" do
    get :edit, { id: albums(:one).id }
    assert_response :success
    assert_template :edit
  end

  test "should update an album with valid data" do
    # I struggled with this one for a bit, trying to figure out how to pass both the album id and the album's parameters to the update call. Somehow, I stumbled on http://stackoverflow.com/questions/13150272/meaning-for-attributes-for-in-factorygirl-and-rspec-testing and figured out that album.attributes would give me the hash of data I needed.
    album = albums(:two)
    album.description = "I updated this description"
    patch :update, { id: albums(:two).id, album: album.attributes }
    assert_redirected_to album_path(assigns(:album))
  end

  test "should render the edit page if try to update an album with invalid data" do
    album = albums(:three)
    album.description = nil
    patch :update, { id: albums(:three).id, album: album.attributes }
    assert_template :edit
  end

  test "should destroy an album" do
    delete :destroy, { id: albums(:four) }
    assert_response :redirect
    assert_redirected_to albums_path
  end

  test "#upvote should add one to the rank of the given item" do
    # I wrote my upvote method to redirect to the page that the upvote was called from, so I need to make a fake page in my test in order to have the method work. I'm going to pretend that this test is coming from the root. 
    session[:return_to] = root_path
    album = albums(:five)
    before_votes = album.rank

    patch :upvote, { id: album.id }

    after_album = Album.find(albums(:five).id)

    assert_equal after_album.rank, before_votes + 1
    assert_redirected_to root_path
  end
end
