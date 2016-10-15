require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "index should show all the books" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "new should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "add a new book to the DB" do
    post_params = { book: { title: "New Book",
      author: "Allison" } }
    assert_difference('Book.count', 1) do
      post :create, post_params
    end

    book = assigns(:book)
    assert_redirected_to book_path(book)
  end

  test "doesn't add an invalid book to the DB" do
    post_params = { book: { author: "Allison" } }
    assert_no_difference('Book.count') do
      post :create, post_params
    end

    assert_template :new
  end

  test "should show the requested book" do
    book_id = books(:valid_book).id
    get :show, { id: book_id }
    assert_response :success
    assert_template :show

    book = assigns(:book)
    assert_not_nil book
    assert_equal book.id, book_id
  end

  # test "doesn't show a non-existant book" do
  #   book_id = 843
  #   # Bogus book ID shouldn't be in the DB, otherwise test is invalid
  #   assert_raises ActiveRecord::RecordNotFound do
  #     Book.find(book_id)
  #   end
  #
  #   get :show, { id: book_id }
  #   assert_response :not_found
  # end

  test "edit should get the edit form for a book" do
    book_id = books(:valid_book).id
    get :edit, { id: book_id }
    assert_response :success
    assert_template :edit
  end

  # test "edit doesn't get the edit form for a non-existant book" do
  #   book_id = 1234
  #   get :edit, { id: book_id }
  #   assert_response :error
  # end
  #
  # test "updates a book in the DB" do
  #   book_id = books(:valid_book).id
  #   patch :update, { id: book_id }, :valid_book => {title: "Allison's Book", author: "Allison"}
  #
  #   book = assigns(:book)
  #   assert_redirected_to book_path(book)
  #   assert_equal "Allison's Book", book.title
  # end

  test "should destroy book" do
    book_id = books(:valid_book).id
    assert_difference('Book.count', -1) do
      delete :destroy, { id: book_id }
    end

    assert_redirected_to books_path
  end

  test "should redirect to the correct page" do
    book_id = books(:valid_book).id
    patch :upvote, { id: book_id }

    book = assigns(:book)
    assert_redirected_to book_path(book)
  end
end
