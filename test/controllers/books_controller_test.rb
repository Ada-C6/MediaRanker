require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "(new) should get the book new form page" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: 'partial/_form', count: 1
    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "show the requested book" do
    book_id= books(:valid_data).id
    get :show, { id: book_id }
    assert_response :success
    assert_template :show
    assert_template partial: 'partial/_show', count: 1
    book = assigns(:book)
    assert_not_nil book
    assert_equal book.id, book_id
  end

  test "(edit) should get the book edit form page" do
    book_id= books(:valid_data).id
    get :edit, {id: book_id}
    assert_response :success
    assert_template :edit
    assert_template partial: 'partial/_form', count: 1
    book = assigns(:book)
    assert_not_nil book
    assert_equal book.id, book_id
  end

  test "should update book" do
    book_id= books(:valid_data).id
    assert_difference('Book.count', 0) do
      patch :update, id: book_id , book: { name: "name", discription: "discription" }
    end
    assert_redirected_to book_path(book_id)
  end

  test "should create book" do
    assert_difference('Book.count', 1) do
      params = {
        book: {
          name: "book 1",
          author: "author 1",
          description: "description 1"
          } }
          post :create, params
    end
    assert_redirected_to book_path(assigns(:book).id)
  end

  test "should not create book" do
  params = {
    book: {
      author: "book1",
      description: "description 1"
      } }
      post :create, params
    assert_response 200
  end

  test "index should get all the books" do
    all_books = assigns(:books)
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'partial/_index', count: 1
    assert_not_nil books
  end

  test "should destroy book" do
    book_id= books(:valid_data).id
    assert_difference('Book.count', -1) do
      delete :destroy, id: book_id
    end
    assert_redirected_to books_path
  end
end
