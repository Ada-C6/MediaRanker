require 'test_helper'

class BooksControllerTest < ActionController::TestCase
    test "will show the books index view and assign the books instance variable" do
        get :index
        assert_response :success
        assert_template 'books/index'

        books = assigns(:books)
        assert_not_nil books
    end

    test "will get the new form for a new book" do
        get :new
        assert_response :success
        assert_template :new

        book = assigns(:book)
        assert_not_nil book
        assert_nil book.id
    end

    test "will add a new (named) book to the DB and redirect to book index page" do
        post_params = { book: { name: "yellow mellow" } }
        assert_difference('Book.count', 1) do
            post :create, post_params
        end

        assert_redirected_to books_path
    end

    test "will not add a new (unnamed) book to the DB, instead will render the book new page" do
        post_params = { book: { description: "yo yo what's up?" } }
        assert_no_difference('Book.count', 1) do
            post :create, post_params
        end

        assert_template 'books/new'
    end

    test "will show the requested book" do
        book_id = books(:another_book).id
        get :show, { id: book_id }
        assert_response :success
        assert_template :show

        book = assigns(:book)
        assert_not_nil book
        assert_equal(book.id, book_id)
    end

    test "will get the edit form to edit a book" do
        book_id = books(:another_book).id
        get :edit, { id: book_id }
        assert_response :success
        assert_template :edit

        book = assigns(:book)
        assert_not_nil book
        assert_not_nil book.id
    end
end
