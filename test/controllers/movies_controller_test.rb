require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should go to the index page when requested" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get the new form for a new movie" do
    get :new
    assert_response :success
    assert_template :new

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  test "should show the requested movie" do
    get :show, { id: movies(:psycho).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:movie), movies(:psycho)
  end

  test "will add a valid new movie to the DB" do
    post_params = { movie: { title: "NEW MOVIE",
								 director: "New Director", description: "Description of NEW MOVIE" } }
    assert_difference('Movie.count', 1) do
      post :create, post_params
    end

    assert_redirected_to movies_path
  end

  test "won't add an invalid movie" do
   post_params = { movie: { director: "FoobarGuy" } }
   assert_no_difference('Movie.count') do
     post :create, post_params
   end
   assert_template :new
 end


 test "should get edit form" do
   id = movies(:jaws).id
   get :edit, { id: id }
   assert_response :success
   assert_template :edit
 end

 test "should update the movie" do
   id = movies(:king_kong).id
   patch :update, {id: id, movie: {title: "Updated King Kong"} }
   assert_equal "Updated King Kong", Movie.find(id).title
   assert_redirected_to movies_path
 end

 test "destroy should delete the movie" do
    id = movies(:sound_of_music).id
    assert_difference("Movie.count", -1) do
      delete :destroy, {id: id}
    end
    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(id)
    end
    assert_redirected_to movies_path
  end

end
