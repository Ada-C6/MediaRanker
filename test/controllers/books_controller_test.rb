require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should go to the index page when requested" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get the new form for a new book" do
    get :new
    assert_response :success
    assert_template :new

    book = assigns(:book)
    assert_not_nil book
    assert_nil book.id
  end

  test "should show the requested book" do
    get :show, { id: books(:wild_things).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:book), books(:wild_things)
  end

  test "will add a valid new book to the DB" do
    post_params = { book: { title: "NEW BOOK",
                 author: "New Author", description: "Description of NEW BOOK" } }
    assert_difference('Book.count', 1) do
      post :create, post_params
    end

    assert_redirected_to books_path
  end

  test "won't add an invalid book" do
   post_params = { book: { author: "FoobarGuy" } }
   assert_no_difference('Book.count') do
     post :create, post_params
   end
   assert_template :new
  end


  test "should get edit form" do
   id = books(:giving_tree).id
   get :edit, { id: id }
   assert_response :success
   assert_template :edit
  end

  test "should update the book" do
   id = books(:wizard_of_oz).id
   patch :update, {id: id, book: {title: "Updated Wizard of Oz"} }
   assert_equal "Updated Wizard of Oz", Book.find(id).title
   assert_redirected_to books_path
  end

  test "destroy should delete the book" do
    id = books(:green_eggs).id
    assert_difference("Book.count", -1) do
      delete :destroy, {id: id}
    end
    assert_raises ActiveRecord::RecordNotFound do
      Book.find(id)
    end
    assert_redirected_to books_path
  end

end
