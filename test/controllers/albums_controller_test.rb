require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: albums(:spiceworld).id }
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    get :edit, {id: albums(:spiceworld).id }
    assert_response :success
    assert_template :edit
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete an album that exists and NOT flash a notification" do
    assert_includes(Album.all, albums(:spiceworld), "Yes that object exists." )
    delete :destroy, {id: albums(:spiceworld).id }
    refute_equal flash[:notice], "That album does not exist."
    assert_redirected_to :albums
    refute_includes(Album.all, albums(:spiceworld), "That object does not exist." )
  end

  test "deleting an album should change the number of albums" do
    assert_difference("Album.count", -1) do
    delete :destroy,  {id: albums(:spiceworld).id }
    end
  end

  test "attempting to delete an album that doesn't exist should flash a notification" do
    assert_includes(Album.all, albums(:spiceworld), "Yes that object exists." )
    delete :destroy, {id: albums(:spiceworld).id }
    refute_includes(Album.all, albums(:spiceworld), "That object does not exist." )
    delete :destroy, {id: albums(:spiceworld).id }
    assert_equal flash[:notice], "That album does not exist."
    assert_redirected_to :albums
  end

  test "should create an album" do
    params = {album:{name: "Mmmbop", artist: "Hanson", description: "Mmmbop will be stuck in your head for the entire 90s - sorry.", votes: 0}}
    post :create, params
    assert_response :redirect
  end

  test "creating an album should change the number of albums" do
    assert_difference("Album.count", 1) do
    params = {album:{name: "Mmmbop", artist: "Hanson", description: "Mmmbop will be stuck in your head for the entire 90s - sorry.", votes: 0}}
    post :create, params
    end
  end

  test "should update an album" do
    album_params = {id: albums(:spiceworld).id, album:{name: "SpiceWorld!!!"}}
    patch :update, album_params
    assert_response :redirect
  end

  test "should upvote an album" do
    request.env["HTTP_REFERER"] = "where_i_came_from"
    post :up_vote,  {id: albums(:spiceworld).id }
    assert_redirected_to("where_i_came_from")
  end


end
