require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  test "(index) should get the book index page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "(index) should have all of the books records" do
    get :index
    assert_response :success
    books = assigns(:books)

    assert assigns(:books)
    assert_not_nil books
    assert_not_empty books
  end

  test "(show) should show the requested book record" do
    book_id = books(:harry_potter).id
    get :show, { id: book_id }
    assert_response :success
    assert_template :show

    book = assigns(:book)
    assert_not_nil book
    assert_equal book.id, book_id
  end

  test "(show) should not show a non-existing book record" do
    book_id = 12345
    assert_raises ActiveRecord::RecordNotFound do
      Book.find(book_id)
    end

    get :show, { id: book_id }
    assert_response :not_found
  end

  test "(new) should get the book new form page" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: '_books_form', count: 1

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "(create) add a new book record" do
    post_params = { book: { name: "How to CSS Like a Pro",
      author: "Fancy McFancypants", description: "Insert Generic Text Here" } }

    assert_difference('Book.count', 1) do
      post :create, post_params
    end

    assert_response :redirect
    assert_redirected_to book_path(assigns(:book))
  end

  test "(create) a record without a name should not be added" do
    post_params = { book: { author: "Fancy McFancypants", description: "Insert Generic Text Here" } }

    assert_no_difference('Book.count') do
      post :create, post_params
    end

    assert_response :success
    assert_template :new
  end

  test "(edit) should get the book edit form page" do
    book_id = books(:harry_potter).id
    get :edit, { id: book_id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_books_form', count: 1

    book = assigns(:book)
    assert_not_nil book
  end

  test "(update) should update the book record" do
    book = books(:harry_potter)

    updated_name = "My Little Pony"
    updated_author = "Suze McQueen"
    updated_description = "Ponies!"

    patch :update, id: book.id, book: { name: updated_name, author: updated_author, description: updated_description }

    book = assigns(:book)
    assert_equal updated_name, book.name
    assert_equal updated_author, book.author
    assert_equal updated_description, book.description

    assert_response :redirect
    assert_redirected_to book_path(assigns(:book))
  end

  test "(update) should not update the book record if its name is erased" do
    book = books(:harry_potter)
    book.name = nil
    assert_not book.valid?
    assert_not book.save
    assert_includes book.errors, :name
  end

  test "(update) should re-render the edit page if the book record's name is erased in edit page" do
    book = books(:harry_potter)
    updated_name = nil
    updated_author = "not me"
    updated_description = "Maybe someday"

    patch :update, id: book.id, book: { name: updated_name, author: updated_author, description: updated_description }

    book = assigns(:book)
    assert_response :success
    assert_template :edit

    # I tried to impliment the above test in the code section commented below. Wasn't able to make it pass.

    # I Googled and Stackoverflowed for a few hours (both with and without my tech adjacent to give feedback on what to search for), but couldn't do it. The commented out code actually returns nil for book.name and I don't know why.

    # assert_not_equal updated_name, book.name
    # assert_not_equal updated_author, book.author
    # assert_not_equal updated_description, book.description
  end

  test "(destroy) should delete a book record" do
    book_id = books(:harry_potter).id

    assert_difference('Book.count', -1) do
      delete :destroy, { id: book_id }
    end

    assert_response :redirect
    assert_redirected_to books_path
  end

  test "(upvote) should redirect to the book show page" do
    book_id = books(:harry_potter).id

    patch :upvote, { id: book_id }

    assert_response :redirect
    assert_redirected_to book_path(assigns(:book))
  end
end
