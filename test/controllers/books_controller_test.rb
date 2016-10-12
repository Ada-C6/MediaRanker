require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create" do
    post_params = {book: {title:"We are the world" }}
    post :create, post_params
    assert_response :redirect
  end

#   test 'creating book changes the number of books'
#   assert_difference("Book.count", 1) do
#     post_params = {book: {title: "Little Women"}  }
#         post :create, post_params
#         assert_response :redirect
# end
  test "should get edit" do
    get :edit, {id: 1}
    assert_response :success
  end

  test "should be able update a book" do
    patch :update, {id: books(:one).id }, {book: {title: "No Way", creator: "Bob Dylon", description:"So good"}}
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

end
