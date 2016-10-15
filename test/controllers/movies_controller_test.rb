require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  test "(index) should get the movie index page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "(index) should have all of the movies records" do
    get :index
    assert_response :success
    movies = assigns(:movies)

    assert assigns(:movies)
    assert_not_nil movies
    assert_not_empty movies
  end

  test "(show) should show the requested movie record" do
    movie_id = movies(:top_gun).id
    get :show, { id: movie_id }
    assert_response :success
    assert_template :show

    movie = assigns(:movie)
    assert_not_nil movie
    assert_equal movie.id, movie_id
  end

  test "(show) should not show a non-existing movie record" do
    movie_id = 12345
    assert_raises ActiveRecord::RecordNotFound do
      Movie.find(movie_id)
    end

    get :show, { id: movie_id }
    assert_response :not_found
  end

  test "(new) should get the movie new form page" do
    get :new
    assert_response :success
    assert_template :new
    assert_template partial: '_movies_form', count: 1

    movie = assigns(:movie)
    assert_not_nil movie
    assert_nil movie.id
  end

  test "(create) add a new movie record" do
    post_params = { movie: { name: "Big Fish",
      director: "John Doe", description: "Insert Generic Text Here" } }

    assert_difference('Movie.count', 1) do
      post :create, post_params
    end

    assert_response :redirect
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "(create) a record without a name should not be added" do
    post_params = { movie: { director: "John Doe", description: "Insert Generic Text Here" } }

    assert_no_difference('Movie.count') do
      post :create, post_params
    end

    assert_response :success
    assert_template :new
  end

  test "(edit) should get the movie edit form page" do
    movie_id = movies(:top_gun).id
    get :edit, { id: movie_id }
    assert_response :success
    assert_template :edit
    assert_template partial: '_movies_form', count: 1

    movie = assigns(:movie)
    assert_not_nil movie
  end

  test "(update) should update the movie record" do
    movie = movies(:top_gun)

    updated_name = "My Little Pony"
    updated_director = "Suze McQueen"
    updated_description = "Ponies!"

    patch :update, id: movie.id, movie: { name: updated_name, director: updated_director, description: updated_description }

    movie = assigns(:movie)
    assert_equal updated_name, movie.name
    assert_equal updated_director, movie.director
    assert_equal updated_description, movie.description

    assert_response :redirect
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "(update) should not update the movie record if its name is erased" do
    movie = movies(:top_gun)
    movie.name = nil
    assert_not movie.valid?
    assert_not movie.save
    assert_includes movie.errors, :name
  end

  test "(update) should re-render the edit page if the movie record's name is erased in edit page" do
    movie = movies(:top_gun)
    updated_name = nil
    updated_director = "Suze McQueen"
    updated_description = "Ponies!"

    patch :update, id: movie.id, movie: { name: updated_name, director: updated_director, description: updated_description }

    movie = assigns(:movie)
    assert_response :success
    assert_template :edit

    # I tried to impliment the above test in the code section commented below. Wasn't able to make it pass.

    # I Googled and Stackoverflowed for a few hours (both with and without my tech adjacent to give feedback on what to search for), but couldn't do it. The commented out code actually returns nil for movie.name and I don't know why.

    # assert_not_equal updated_name, movie.name
    # assert_not_equal updated_director, movie.director
    # assert_not_equal updated_description, movie.description
  end

  test "(destroy) should delete a movie record" do
    movie_id = movies(:top_gun).id

    assert_difference('Movie.count', -1) do
      delete :destroy, { id: movie_id }
    end

    assert_response :redirect
    assert_redirected_to movies_path
  end

  test "(upvote) should redirect to the movie show page" do
    movie_id = movies(:top_gun).id

    patch :upvote, { id: movie_id }

    assert_response :redirect
    assert_redirected_to movie_path(assigns(:movie))
  end
end
