require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  # called before every single test - makes sure we are
  # testing something not in our database
  # but from fixtures - we know it exists.
    setup do
      @book = books(:Harry_Potter)
    end

    # called after every single test
    teardown do
      # when controller is using cache it may be a good idea to reset it afterwards
      Rails.cache.clear
    end

###### INDEX ######
  test "index should display books" do
    get :index
    assert_response :success
    assert_template :index
    assert_template partial: 'layouts/_index', count: 1

    books = assigns(:books)

    assert_not_nil books
  end

  test "index should show all the books" do
    get :index
    books = assigns(:books)

    assert_equal books.count, Book.count
  end

  test "index displays the highest ranked book first" do
    get :index
    books = assigns(:books)

    #books are ranked based on number of upvotes
    assert_operator books.first.upvotes, :>=, books.last.upvotes
  end


###### SHOW ######
  test "show should display a book" do
    get :show, { id: @book.id }
    assert_response :success
    assert_template :show
    assert_template partial: 'layouts/_show', count: 1

    book = assigns(:book)

    assert_not_nil book
  end


###### NEW ######
  test "new should get the new form for a new book" do
    get :new

    assert_response :success
    assert_template :new
    assert_template partial: 'layouts/_new', count: 1
    assert_template partial: 'layouts/_form', count: 1
  end

  test "new should not yet save the book" do
    get :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end


###### CREATE ######
  test "Create adds a book to the database" do
    assert_difference('Book.count', 1) do
      post :create, book: { name: 'Test title', author: 'Sarah Nahmias', description: 'A testy film' }
    end
  end

  test "Create should create a book with 0 upvotes" do
    post :create, book: { name: 'Test title 0', author: 'Sarah Nahmias', description: 'A testy book' }

    added_book = Book.last
    assert_equal 0, added_book.upvotes
  end

  test "Create redirect us to the new book's show page" do
    post :create, book: { name: 'Show me the Test title', author: 'Sarah Nahmias', description: 'A testy book' }

    added_book = Book.last
    assert_redirected_to book_path(added_book)
  end


###### EDIT ######
    test "Edit should get the form for updating specific book" do
      get :edit, { id: @book.id }

      assert_response :success
      assert_template :edit
      assert_template partial: 'layouts/_edit', count: 1
      assert_template partial: 'layouts/_form', count: 1

      book = assigns(:book)
      assert_not_nil book
    end


###### UPDATE ######
    test "Update does not add a book to the database" do
      assert_no_difference('Book.count') do
        patch :update, { id: @book.id, book: { name: 'Update Harry Potter' } }
      end
    end

    test "should update book" do
    patch :update, { id: @book.id, book: { name: 'Updated' } }

    # Reload association to fetch updated data and assert that title is updated.
    @book.reload
    assert_equal "Updated", @book.name
    end

    test "should redirect to book's show page" do
    patch :update,  { id: @book.id, book: { name: 'Updated2' } }

    assert_redirected_to book_path(@book)
    end


###### UPVOTE ######
  test "Upvoting a book adds 1 to its upvotes" do
    assert_difference("Book.find(@book.id).upvotes", 1) do
      patch :upvote, { id: @book.id }
    end
  end


###### DESTROY ######
  test "Destroy removes a book from the database" do
    assert_difference('Book.count', -1) do
      delete :destroy, { id: @book.id }
    end
  end

  test "Destroy redirects us to the books index page" do
    delete :destroy, { id: @book.id }

    assert_redirected_to books_path
  end

end
