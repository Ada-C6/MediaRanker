require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "show the requested book" do
    book_id = books(:anna_karenina).id
    get :show, {id: book_id}
    assert_response :success
    assert_template :show
    assert_equal assigns(:book), books(:anna_karenina)
  end

  test "show the error message for a non-existing book" do
    book_id = 1232432432432
    assert_raises ActiveRecord::RecordNotFound do
      Book.find(book_id)
    end

    get :show, { id: book_id }
    assert_response :not_found
  end

  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.name
  end

  test "should create a book with valid inputs" do
    assert_difference('Book.count', 1) do
      post_params = { book: { name: "Hello", author: "Goodbye"}}
      post :create, post_params
    end

    assert_redirected_to books_path
  end

  test "cannot create a book without valid inputs and will render the new form" do
    assert_no_difference('Book.count') do
      post_params = { book: { name: nil, author: nil}}
      post :create, post_params
    end
    assert_template :new
    assert_response :success
  end

  test "should get the form to edit an existing book" do
    get :edit, { id: books(:anna_karenina).id}
    assert_response :success
    assert_template 'books/edit'
    assert_template partial: '_form', count: 1

    book = assigns(:book)
    assert_not_nil book
    assert_not_nil book.name
  end

  test "should update an existing book with valid new inputs" do
    book = books(:anna_karenina)

    assert_no_difference('Book.count') do
      patch :update, id: book.id, book: { name: "Hello Billy" }
    end

    assert book.reload
    assert_equal "Hello Billy", book.name

    assert_redirected_to book_path(book.id)
    assert_response :redirect
  end

  test "cannot update a book without valid inputs and will render the 'edit' form" do
    book = books(:anna_karenina)

    assert_no_difference('Book.count') do
      patch :update, id: book.id, book: { name: nil }
    end

    assert book.reload
    assert_template :edit
    assert_response :success
  end

  test "should change the value of the 'ranked' data field when call the 'upvote' method" do
    book = books(:the_prince)
    patch :upvote, id: book.id
    assert book.save
    assert_redirected_to book_path(book.id)
    assert_response :redirect
  end

  test "can destroy a book" do
    book = books(:the_prince)
    assert_difference('Book.count', -1) do
      delete :destroy, id: book.id
    end
    assert_redirected_to books_path
    assert_response :redirect
  end
end
