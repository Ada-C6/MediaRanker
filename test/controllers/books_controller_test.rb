require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  test "Should be able to bring up books index page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "Should be able to show the page for a particular book if book exists" do
    # For an book that exists
    get :show, {id: books(:one).id}
    assert_response :success
    assert_template :show

    # For an book that doesn't exist
    get :show, {id: -1}
    assert_response :missing
  end

  test "Should be able to show the page to create a new book" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "Should be able to create an book only if fields are correctly filled" do
    # Book with all fields completed - should be created and redirected
    post :create, { book: {title: "BookName", author: "BookAuthor", description: "BookDescription"}}
    assert_response :redirect
    assert_redirected_to books_show_path(Book.last)

    # Book with a missing field - should render the new page again
    post :create, { book: {name: "BookName", description: "BookDescription"}}
    assert_response :error
    assert_template :new
  end

  test "The number of books in the database should increment by one when an book is created" do
    # Book with full input data
    assert_difference('Book.count', 1) do
      post :create, { book: {title: "BookName1", author: "BookAuthor1", description: "BookDescription1"}}
    end

    # Book with a missing field - fails validation, should not cause an increase
    assert_difference('Book.count', 0) do
      post :create, { book: {title: "BookName1", description: "BookDescription1"}}
    end
  end


  test "Should be able to get the edit page for an book if the book exists" do
    # For book that exists
    get :edit, { id: books(:one).id }
    assert_response :success
    assert_template :edit

    # For book that does not exist
    get :edit, { id: -1 }
    assert_response :missing
  end

  # https://garrickvanburen.com/passing-sessions-and-referers-in-rails-functional-tests/
  # But referer is apparently not reliable, so look for a more robust way to do this

  test "Should be able to patch an update (for upvote) if the record exists" do
    # If referer is nil, default should be redirect to books index
    patch :update, { id: books(:one).id}
    assert_response :redirect
    assert_redirected_to books_index_path

    # From show page
    @request.env['HTTP_REFERER'] = '/show'
    patch :update, { id: books(:one).id}
    assert_response :redirect
    assert_redirected_to books_show_path(books(:one).id)

    # From index page
    @request.env['HTTP_REFERER'] = '/index'
    patch :update, { id: books(:one).id}
    assert_response :redirect
    assert_redirected_to books_index_path

    # Attempting to update a record that does not exist
    patch :update, { id: -1 }
    assert_response :missing
  end

  # I'm not sure why, but using the fixture directly - books(:one).upvotes - will result in a
  # failing test and the appearance of no incrementation. The same is true for editing of apparently
  # field. My theory is that if there is a redirect in a test, the fixture may get reset as control
  # is returned back to the test. In any case, this feature actually does work, so I think the
  # Book.find(books(:one).id) is a workaround that gives an accurate reflection of whether things
  # are working.
  #
  # UPDATE: You need to do a .reload on the record at the end of the assert_difference in order
  # to retrieve it with its new values: http://edgeguides.rubyonrails.org/testing.html.

  test "Patching an update (for upvote) should result in an increase of 1 in the number of upvotes of a record" do
    assert_difference('books(:one).upvotes', 1) do
      @request.env['HTTP_REFERER'] = '/index'
      patch :update, { id: books(:one).id }
      books(:one).reload
    end
  end

  test "Should be able to put an update (for edit to book data)" do
    # Update good record with good info
    put :update, { id: books(:one).id, book: { title: "MyBook1", author: "MyAuthor1", description: "MyDescription1" } }
    assert_response :redirect
    assert_redirected_to books_show_path(books(:one).id)

    # Update good record with bad info
    put :update, { id: books(:one).id, book: { title: "MyBook", author: "", description: "MyDescription" } }
    assert_response :error
    assert_template :edit

    # Update non-existent record
    put :update, { id: -1, book: { title: "MyBook", author: "MyAuthor", description: "MyDescription" } }
    assert_response :missing
  end

  test "Putting an update (for edit to book data) should change the relevant book data as expected" do
    # Update good record with good info
    original_title = books(:one).title
    put :update, { id: books(:one).id, book: { title: "MyBook2", author: "MyAuthor2", description: "MyDescription2" } }
    books(:one).reload

    assert_equal books(:one).title, "MyBook2"
    assert_equal books(:one).author, "MyAuthor2"
    assert_equal books(:one).description, "MyDescription2"
    assert_not_equal original_title, books(:one).title
  end

  test "Should be able to destroy an book if it exists" do
    # Destroying an book that exists
    get :destroy, { id: books(:one).id }
    assert_response :redirect
    assert_redirected_to books_index_path

    # Trying to destroy an book that does not exist
    get :destroy, { id: -1 }
    assert_response :missing
  end

  test "The number of books in the database should decrement by one when an book is destroyed" do
    assert_difference('Book.count', -1) do
      get :destroy, { id: books(:one).id }
    end
  end

end
