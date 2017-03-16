require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: books(:pride).id}
    assert_response :success
    assert_template :show

    assert_equal assigns(:book), books(:pride)
  end

  test "should get edit" do
    get :edit, {id: books(:pride).id}
    assert_response :success
    assert_template :edit

    assert_equal assigns(:book), books(:pride)
    assert_equal assigns(:book).written_by, "Jane Austen"
    assert_template partial: '_bookform', count: 1

  end

  test "should be able to update" do
    patch :update, :id => books(:pride), :book => {:title => 'Pride'}
    assert_equal "Pride", assigns(:book).title
    assert_response :success
    assert_template :edit
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
    assert_template partial: '_bookform', count: 1
  end

  test "should be able to create an book" do
    post_params = {book: {title: "Fifth Season"}}
    post :create, post_params
    assert_response :success
    assert_template :new
  end

  test "creating an book changes the number of books" do
  assert_difference("Book.count", 1) do
    post_params = {book: {title: "Fifth Season", written_by: "N.K.Jemison", description: "Good stuff."}}
    post :create, post_params
  end
end

  test "should be able to delete an book" do
    delete :destroy, {id: books(:pride).id}
    assert_response :redirect
    assert_redirected_to books_path
  end

  test "deleting an book changes the number of books" do
    assert_difference("Book.count", -1) do
      delete :destroy, {id: books(:pride).id}
      assert_response :redirect
    end
  end

  test "should be able to use upvote method to increase rating on book" do
    assert_difference("Book.find(books(:pride).id).ranked", 1) do
      put :upvote, {id: books(:pride).id}
    end
  end

  test "should not be able to delete something that isn't there" do
    delete :destroy, {id: 324987324}
    assert_response :missing
  end

end
