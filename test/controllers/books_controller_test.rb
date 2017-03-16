require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should show list of books" do
    get :index
    assert_response :success
  end

  test "should show specified book" do
    get :show, {id: books(:rainbow).id}
    assert_response :success
  end

  test "should show form to add book" do
    get :new
    assert_response :success
  end

  test "should create new book" do
    assert_difference("Book.count", 1) do
      post :create, {book: {name: "Wow"}}
    end
    assert_response :redirect
  end

  test "should show form to edit specified book" do
    get :edit, {id: books(:rainbow).id}
    assert_response :success
  end

  test "should update book information correctly" do
    put :update, id: books(:rainbow), book: {name: "The Rainbow Fish", author: "fix author", description: "A fish has beautiful scales."}
    book = Book.find_by(name: "The Rainbow Fish")

    assert_equal "fix author", book.author
    assert_response :redirect
  end

  test "should delete book" do
    assert_difference("Book.count", -1) do
      delete :destroy, {id: books(:rainbow).id}
    end
    assert_response :redirect
  end

  test "should update book information with rank" do
    put :upvote, {id: books(:rainbow).id}
    assert_response :redirect
  end

end
