require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index

    books = assigns(:books)

    assert_not_empty books

  end


  test "should get show" do
    get :show, {id: books(:one).id}
    assert_response :success
    assert_template :show

    book = assigns(:book)

    assert_not_nil(book)
    book_id = books(:one).id
    assert_equal book_id, book.id

  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)

    assert_not_nil(book)
    assert_not book.valid?
    book.title = "Test hi hello"
    assert book.valid?

  end

  test "Adds a new book to book database" do
    assert_difference('Book.count', 1) do
      post :create, { book: {title: "This book is for testing"} }
    end
    assert_response :redirect

    book1 = Book.new()
    assert_not book1.valid?
  end

  test "will get form to edit an existing book" do
    get :edit, {id: books(:two).id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_form', count: 1

    book = assigns(:book)
    assert_not_nil(book)
    assert book.valid?

  end

  test "Should save updated book to database" do
    book = books(:one)
    patch :update, { id: book.id, book: {title: "Wrath of Guinevere"} }

    assert_not_equal books(:one).title, Book.find(book.id).title
    assert book.valid?
    assert_response :redirect

  end

  test "Should not update a book to have no title" do
    book = books(:two)
    patch :update, { id: book.id, book: {title: "This title remains the same if I try to update it to an empty string"} }
    assert_equal Book.find(book.id).title, "This title remains the same if I try to update it to an empty string"

    patch :update, { id: book.id, book: {title: ""} }
    assert_equal Book.find(book.id).title, "This title remains the same if I try to update it to an empty string"
    assert_response :success

  end

  test "Should delete a record from the database" do
    book_id = books(:three).id
    assert_difference('Book.count', -1) do
      delete :destroy, { id: book_id }
    end

    assert_response :redirect
  end
end
