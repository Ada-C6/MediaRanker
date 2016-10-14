require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "should show the show page for the specified book" do
    book_id = books(:one_fish_two_fish).id
    get :show, { id: book_id }
    assert_response :success
    assert_template :show

    book = assigns(:book)
    assert_not_nil book
    assert_equal book.id, book_id
  end

  test "should show 404 error for invalid book id" do
    book_id = 1346134598    # Boguse ID shouldn't be in DB, otherwise test is invalid
    assert_raises StandardError do
      Book.find(book_id)
    end

    get :show, { id: book_id }
    assert_response :not_found
  end

  test "add a new book to the DB" do
    post_params = { book: { name: "To Kill a Mockingbird",
								    author: "Harper Lee",
                    description: "Eh" } }
    assert_difference('Book.count', 1) do
      post :create, post_params
    end

    book = assigns(:book)
    assert_redirected_to book_path(book.id)
  end

  test "cannot add invalid book to DB" do
    post_params = {book: { name: "To Kill a Mockingbird"} }
    assert_equal('Book.count', 'Book.count') do
      post :create, post_params
    end

    assert render: :new
  end

  test "will delete a book from the DB" do
    book = books(:one_fish_two_fish)
    assert_difference('Book.count', -1) do
      delete :destroy, id: book
    end

    assert_redirected_to books_path
  end

  # test "the truth" do
  #   assert true
  # end
end
