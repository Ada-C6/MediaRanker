require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:correct_book)
  end

  ############### INDEX ###############
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:books)
  end

  test "Index should populate all the records of books" do
    get :index

    assert_equal assigns(:books).count, Book.count
  end

  test "Index should sort the books by rank" do
    get :index
    books = assigns(:books)

    assert_operator books[0].rank_points, :>=, books[-1].rank_points
  end

  ############### NEW ###############
  test "New should get new page" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "New should create a new book but not save it yet" do
    get :new
    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  ############### CREATE ###############
  test "Create should add 1 to all books" do
    assert_difference('Book.count', 1) do
      post :create, book: { name: "lksjdf", author: "sdfasdf", rank_points: 0 }
    end
  end

  test "Create should redirect to created book page" do
    post :create, book: { name: "lkjsdf", author: "sjkfsa", rank_points: 0 }

    assert_response :found
    assert_redirected_to book_path(assigns(:book))
  end

  ############### SHOW ###############
  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  ############### EDIT ###############
  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  ############### UPDATE ###############
  test "should redirect to correct page" do
    patch :update, id: @book, book: { name: "sdfsdfsd" }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should update book name" do
    patch :update, id: @book, book: { name: "hey" }
    assert_equal "hey", assigns(:book).name
    assert_redirected_to book_path(assigns(:book))
  end

  ############### DESTROY ###############
  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
