require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  #INDEX:
    test "should go to the index" do
      get :index

      assert_response :success
      assert_template :index
    end

    test "should display the correct array of books" do
      books = books(:the_untethered_soul, :h_potter)
      get :index

      assert_equal(assigns(:books_by_rank), books(:h_potter, :the_untethered_soul))
    end

    test "should go to books#show page when you click on a book title" do
      get :show, { id: books(:the_untethered_soul).id }

      assert_response :success
      assert_template :show
    end

  # add/create
    test "should go to Books#new when you click on Add a Book" do
      get :new

      assert_response :success
      assert_template :new
    end

    test "should create a book when you click on Add a Book with a name" do
      post_params = { book: { name: "Brazil", author: "South American Writers"} }

      assert_difference('Book.count', 1) do
        post :create, post_params
      end

      assert_redirected_to Book.last
    end

    test "cannot add a new book to the DB if validations aren't met" do
      post_params = { book: { director: "James"} }

      assert_no_difference('Book.count', 1) do
        post :create, post_params
      end

      assert_template(:new)
    end

  # edit/update
    test "should go to Books#edit when you click on Edit" do
      book = books(:the_untethered_soul)
      get :edit, { id: book.id }

      assert_response :success
      assert_template :edit
    end

    test "should update a book" do
      book = books(:the_untethered_soul)
      updated_author = "Updated"

      put :update, id: book.id, book: { author: updated_author }
      assert_redirected_to book_path(assigns(:book))

      book.reload
      assert_equal updated_author, book.author
    end

  # delete
    test "should delete book when you click on Delete" do
      book = books(:the_untethered_soul)
      assert_difference('Book.count', -1) do
        delete :destroy, { id: book.id }
      end

      assert_redirected_to books_path
    end

  #upvote\
    test "should upvote a book when you click on Upvote" do
      book = books(:h_potter)

      setup do
        @request.env['HTTP_REFERER'] = 'http://localhost:3000/books'
        patch :upvote, id: book.id, book: { }
        # assert_redirected_to books_path
        book.reload
        assert_equal 10, book.rank
      end
    end
end
