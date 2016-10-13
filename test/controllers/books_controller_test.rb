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

  test 'creating book changes the number of books' do
    assert_difference "Book.count", 1 do
      post :create, {book: {title: "No Way", creator: "Bob Dylon", description:"So good"}}
        assert_response :redirect
    end
  end
  test "should get edit" do
    get :edit, {id: 1}
    assert_response :success
  end

  test "should be able update a book" do
    patch :update, {id: books(:one).id, book: {title: "No Way", creator: "Bob Dylon", description:"So good"}}
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

  test "deleting a book changes the number of books" do
    assert_difference("Book.count", -1) do
      delete :destroy, {id: books(:one).id}
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
  end

end
