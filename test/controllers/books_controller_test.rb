require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:book_5)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { name: "Brave New World", author: "Aldous Huxley" }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { name: "The Giver", author: "Lois Lowry" }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end

  test "upvote should increment ranking attribute" do
    @book = books(:book_4)
    initial_ranking = @book.ranking
    patch :upvote, { id: @book.id }

    assert_equal assigns(:book).ranking, initial_ranking + 1
    # had attempted to use assert_difference here - tried about 15 different syntaxes unsuccessfully before using assert_equal
  end
end
