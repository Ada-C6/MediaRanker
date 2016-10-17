require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should display the #index view" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get the #new form" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "load #show with given book" do
    get :show, { id: books(:one).id }
    assert_response :success
    assert_template :show
  end

  test "#show should 404 if trying to show an book that doesn't exist" do
    book_id = 12345
    # Artist ID shouldn't exist in the database, otherwise this test is invalid.
    assert_raises ActiveRecord::RecordNotFound do
      Book.find(book_id)
    end

    get :show, { id: book_id }

    assert_response :not_found
  end

  test "#create should render the new page with errors if any of the required fields are missing" do
    book_params = { book: {title: "a title", author: "bad wolves"}}
    post :create, book_params
    assert_template :new
  end

  test "should create an book with valid data" do
    book_params = { book: { title: "Grace", author: "Hopper", description: "She's the bomb." }}
    post :create, book_params
    assert_redirected_to book_path(assigns(:book))
  end

  test "should render the edit page" do
    get :edit, { id: books(:one).id }
    assert_response :success
    assert_template :edit
  end

  test "should update an book with valid data" do
    # I struggled with this one for a bit, trying to figure out how to pass both the book id and the book's parameters to the update call. Somehow, I stumbled on http://stackoverflow.com/questions/13150272/meaning-for-attributes-for-in-factorygirl-and-rspec-testing and figured out that book.attributes would give me the hash of data I needed.
    book = books(:two)
    book.description = "I updated this description"
    patch :update, { id: books(:two).id, book: book.attributes }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should render the edit page if try to update an book with invalid data" do
    book = books(:three)
    book.description = nil
    patch :update, { id: books(:three).id, book: book.attributes }
    assert_template :edit
  end

  test "should destroy an book" do
    delete :destroy, { id: books(:four) }
    assert_response :redirect
    assert_redirected_to books_path
  end

  test "#upvote should add one to the rank of the given item" do
    # I wrote my upvote method to redirect to the page that the upvote was called from, so I need to make a fake page in my test in order to have the method work. I'm going to pretend that this test is coming from the root.
    session[:return_to] = root_path
    book = books(:five)
    before_votes = book.rank

    patch :upvote, { id: book.id }

    after_book = Book.find(books(:five).id)

    assert_equal after_book.rank, before_votes + 1
    assert_redirected_to root_path
  end
end
