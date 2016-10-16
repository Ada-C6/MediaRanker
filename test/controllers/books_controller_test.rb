require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: 'layouts/_form', count: 1

    book = assigns(:book) #this checks that we do have an instance variable
    assert_not_nil book
    assert_nil book.id #check that the id is nil because it hasn't been saved to the database
  end

  test "should show a specific/requested book" do #positive test case
    book_id = books(:matilda).id
    get :show, { id: book_id } #start with request
    assert_response :success
    assert_template :show
    assert_template partial: 'layouts/_show', count: 1

    book = assigns(:book)
    assert_not_nil book
    assert_equal book.id, book_id
  end

  test "Show a non-extant book" do #negative test case
    book_id = "a"

    assert_raises  ActiveRecord::RecordNotFound do
      Book.find(book_id) #make sure this book doesn't exist
    end #what to do if this book id does match? Add 1 to the id and try again.

    get :show, { id: book_id } #start with request
    assert_response :not_found # :missing is a different code
  end

  test "add a new book to the DB" do
    post_params = { book: { title: "Tycho",
                 by: "San Francisco" } }
    assert_difference('Book.count', 1) do
      post :create, post_params
    end

    assert_redirected_to book_path(assigns(:book).id)
  end

  test "does not add new book without valid params" do
    post_params = { book: {
                 description: "San Francisco" } }
    assert_difference('Book.count', 0) do
      post :create, post_params
    end

    assert_template :new
  end

  test "shows all books" do
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'layouts/_index', count: 1
  end

  test "should get the edit form" do
    book_id = books(:the_girls).id
    get :edit, { id: book_id }
    assert_response :success
    assert_template :edit
    assert_template partial: 'layouts/_form', count: 1

    book = assigns(:book)
    assert_not_nil book
  end

  test "should update the book" do
    book = books(:the_girls)

    assert_difference('Book.count', 0) do
      put :update, id: book.id, book: { title: "Tycho", by: "San Francisco" }
    end

    assert_response :found
    assert_equal Book.find(book.id).title, "Tycho"
    assert_redirected_to book_path(book.id)
  end

  test "should render edit page if update does not save and does not save empty string" do
    book = books(:the_girls)
    put :update, id: book.id, book: {title: ""}
    assert_template :edit
  end

  test "upvote should increase ranked by one and not change any other attributes" do
    fix_book = books(:matilda)
    assert_difference('Book.find(fix_book.id).ranked', 1) do
      patch :update, id: fix_book.id, book: { title: "uh" }
    end

    assert_not_equal Book.find(fix_book.id).title, "uh"

    assert_response :found

    book = assigns(:book)
    assert_equal book.ranked, fix_book.ranked + 1, "Assigns Attributes: #{book.attributes} Fixed ID: #{fix_book.id}, assigns id: #{assigns(:book)}"

    assert_redirected_to book_path(fix_book.id)
  end

  test "remove a book from the DB" do
    book_id = books(:matilda).id

    assert_difference('Book.count', -1) do
      delete :destroy, { id: book_id }
    end

    assert_response :redirect
    assert_redirected_to books_path

    assert_not_includes assigns, books(:matilda)
  end


  # unnecessary?
  # test "does not change the DB if user tries to delete non-extant book" do
  #   book_id = "a"
  #
  #   assert_raises  ActiveRecord::RecordNotFound do
  #     Book.find(book_id)
  #   end
  #
  #   assert_difference('Book.count', 0) do
  #     delete :destroy, { id: book_id }
  #   end
  #
  #   assert_response :not_found
  # end

end
