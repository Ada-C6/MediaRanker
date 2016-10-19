require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @book = books(:losing_it)
  end

  test "should show the specific book" do
    get :show, { id: books(:why_class_matters).id }
    assert_response :success
    assert_template :show
    assert_equal assigns(:book), books(:why_class_matters)
  end

  test "should create a book" do
    assert_difference('Book.count') do
      post :create, book: {title: @book.title, author: @book.author}
    end
    assert_redirected_to books_path
  end

  test "should destroy a book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end
    assert_redirected_to books_path
  end

  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new
    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "should update a book" do
    patch :update, id: @book, book: {title: @book.title, author: @book.author}
    assert_redirected_to book_path
  end

  test " should upvote a book" do
    assert_difference('Book.last.rank') do
      patch :upvote, {id: Book.last.id}
    end
  end
end
