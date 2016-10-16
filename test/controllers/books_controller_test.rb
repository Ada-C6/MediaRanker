require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should show the requested book" do
    get :show, { id: books(:pride_and_prejudice).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:book), books(:pride_and_prejudice)
  end

  test "Show a non-existant book" do
    book_id = 12345
    # Bogus book ID shouldn't be in the DB, otherwise test is invalid
    assert_raises ActiveRecord::RecordNotFound do
      Book.find(book_id)
      get :show, { id: book_id }
      assert_response :not_found
    end
  end

  test "should update ranking" do
    book_id = books(:pride_and_prejudice).id
    assert_difference("Book.find(#{book_id}).ranking", 1) do
      patch :upvote, { id: book_id }
    end
  end

  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "add a new book to the DB" do
    post_params = { book: { name: "To Kill a Mockingbird", author: "Harper Lee" } }

    assert_difference('Book.count', 1) do
      post :create, post_params
    end

    assert_redirected_to book_path(Book.last.id)
  end

  test "does not add an invalid book to the DB" do
    post_params = { book: {author: "No One" } }

    assert_difference('Book.count', 0) do
      post :create, post_params
    end
  end

  test "should get the edit form for an existing book" do
    get :edit, { id: books(:pride_and_prejudice).id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_form'

    book = assigns(:book)
    assert_not_nil book
    assert_not_nil book.id
  end

  test "should update book" do
    book = books(:pride_and_prejudice)
    description = "other description"
    book.update( {description: description} )

    assert_response :success
  end

  test "should destroy" do
    book_id = books(:animal_farm).id

    assert_difference('Book.count', -1) do
      delete :destroy, { id: book_id }
    end

    assert_redirected_to books_path
  end

end
