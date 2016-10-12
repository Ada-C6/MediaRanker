require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: books(:matilda).id }
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    get :edit, {id: books(:matilda).id }
    assert_response :success
    assert_template :edit
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete a book" do
    delete :destroy, {id: books(:holes).id }
    assert_response :redirect
  end

  test "deleting a book should change the number of books" do
    assert_difference("Book.count", -1) do
    delete :destroy,  {id: books(:holes).id }
    end
  end

  test "should create a book" do
    params = {book:{name: "A Wrinkle in Time", author: "Madeline L'Engle", description: "A young girl must traverse the multiverse to save her quirky brother and father.", votes: 0}}
    post :create, params
    assert_response :redirect
  end

  test "creating a book should change the number of books" do
    assert_difference("Book.count", 1) do
    params = {book:{name: "A Wrinkle in Time", author: "Madeline L'Engle", description: "A young girl must traverse the multiverse to save her quirky brother and father.", votes: 0}}
    post :create, params
    end
  end

  test "should update a book" do
    book_params = {id: books(:matilda).id, book:{name: "Matilda!!!"}}
    patch :update, book_params
    assert_response :redirect
  end

  test "should upvote a book" do
    request.env["HTTP_REFERER"] = "where_i_came_from"
    post :up_vote,  {id: books(:holes).id }
    assert_redirected_to("where_i_came_from")
  end


end
