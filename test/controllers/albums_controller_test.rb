require 'test_helper'
class AlbumsControllerTest < ActionController::TestCase
test "should get new" do
  get :new
  assert_response :success
end

test "should be able to create" do
  post_params = {album: {title:"Trouble Man" }}
  post :create, post_params
  assert_response :redirect
end

test 'creating book changes the number of albums' do
  assert_difference "Album.count", 1 do
    post :create, {album: {title: "No Way", creator: "Bob Dylon", description:"So good"}}
      assert_response :redirect
  end
end
test "should get edit" do
  get :edit, {id: 1}
  assert_response :success
end

test "should be able update a album" do
  patch :update, {id: albums(:one).id, album: {title: "No Way", creator: "Bob Dylon", description:"So good"}}
  assert_response :redirect
end

test "should get index" do
  get :index
  assert_response :success
end

test "should get show" do
  get :show, {id: 1}
  assert_response :success
end

test "should be able to delete" do
  delete :destroy, {id: 1}
  assert_response :redirect
end

test "deleting an album changes the number of albums" do
  assert_difference("Album.count", -1) do
    delete :destroy, {id: albums(:one).id}
    assert_response :redirect
  end
 end

  # test "deleting a book that isn't in the database" do
  #   delete :destroy, {id: books(:two).id}
  #   assert_no_difference("Book.count") do
  #     delete :destroy, {id: books(:two).id}
  #
  #     assert_response :redirect
  #   end
  # end

end
