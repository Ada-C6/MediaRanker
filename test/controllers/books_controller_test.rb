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

  test "Create should assign an ID to a new record" do
    post :create, book: { name: "lkjsdf", author: "sjkfsa", rank_points: 0 }

    assert_not_nil assigns(:book).id
  end

  test "Create should automatically give a new book rank_points of 1" do
    post :create, book: { name: "lkjsdf", author: "sjkfsa", rank_points: nil }

    assert_equal 1, assigns(:book).rank_points
  end
  
  ############### SHOW ###############
  test "Show should show book and template" do
    get :show, id: @book.id
    assert_response :success
    assert_template :show
  end

  ############### EDIT ###############
  test "Edit should get edit and template" do
    get :edit, id: @book.id
    assert_response :success
    assert_template :edit
  end

  ############### UPDATE ###############
  test "Update should correctly update book name" do
    patch :update, id: @book.id, book: { name: "hey" }
    assert_equal "hey", assigns(:book).name
    assert_redirected_to book_path(assigns(:book))
  end

  test "Update should redirect to correct page" do
    patch :update, id: @book.id, book: { name: "sdfsdfsd" }
    assert_redirected_to book_path(assigns(:book))
  end

  ############### DESTROY ###############
  test "Destroy should lower book count by one" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book.id
    end
  end

  test "Destroy should redirect to books index" do
    delete :destroy, id: @book.id
    assert_redirected_to books_path
  end
end
