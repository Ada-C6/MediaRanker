require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get the entire list of books" do
    # Should populate an array of books
    # should render the :index view
    book = books(:sample)
    bad_book = albums(:sample)
    get :index

    assert_response :success
    assert_template :index

    books = assigns(:full_list)
    assert_not_empty(books)
    assert_includes(books, book)
    assert_not_includes(books, bad_book)
  end

  #SHOW

  test "should show details of book" do
    book_id = books(:sample).id

    get :show, {id: book_id}

    assert_response :success
    assert_template :show

    book = assigns(:this_item)
    assert_not_nil book
    assert_equal book_id, book.id
  end

  test "show a non_extant book" do
    book_id = Book.last.id + 1

    assert_raises ActiveRecord::RecordNotFound do
      Book.find(book_id)
    end

  end

  #NEW
  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new

    item = assigns( :new_item)
    assert_not_nil item
    assert_nil item.id
  end

  # CREATE
  test "should add a new book to the DB" do

    post_params = { book: { title: "Devil wears Prada", author: "no clue", description: "Meryl Strepe(?) and Anne Hathaway"} }

    assert_difference('Book.count', 1) do
      post :create, post_params
    end

    assert_redirected_to books_path
  end

  #EDIT
  test "should get the form of a book to edit" do
    get :edit, id: books(:sample).id
    assert_response :success
    assert_template :edit
  end

  #UPDATE
  test "should update the book" do
    book_params = {name: "Edit", director: "Sucessfully", description: "Please."}

    patch :update, :id => books(:sample).id, book:  book_params
    assert_redirected_to show_book_path(books(:sample).id)

  end

  #DESTROY
  test "should destroy entry" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: books(:sample).id
    end

    assert_redirected_to books_path
  end

  test "should increase the rank by 1" do

  end

end
