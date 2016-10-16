require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should go to the index" do
    get :index

    assert_response :success
  end

#Tests for top3:
#movies:
  test "should display 3 movies on front page if there are more than 3 in the database" do
    movies = movies(:life_of_pi, :glue_sticks, :number_sequence, :jareds_life)
    get :index

    assert_equal(assigns(:movies_by_rank).length, 3)
  end

  test "should display the correct array of movies" do
    movies = movies(:life_of_pi, :glue_sticks, :number_sequence, :jareds_life)
    get :index

    assert_equal(assigns(:movies_by_rank), movies(:life_of_pi, :jareds_life, :number_sequence))
  end

#books:
  test "should display 2 books on front page if there are less than 3 in the database" do
    books = books(:h_potter, :the_untethered_soul)
    get :index

    assert_equal(assigns(:books_by_rank).length, 2)
  end

  test "should display the correct array of books" do
    books = books(:the_untethered_soul, :h_potter)
    get :index

    assert_equal(assigns(:books_by_rank), books(:h_potter, :the_untethered_soul))
  end

#albums:
  test "should display 3 albums on front page if there are only 3 in the database" do
    albums = albums(:digitalism, :cut_copy, :lcd_soundsystem)
    get :index

    assert_equal(assigns(:albums_by_rank).length, 3)
  end

  test "should display the correct array of albums" do
    albums = albums(:digitalism, :cut_copy, :lcd_soundsystem)
    get :index

    assert_equal(assigns(:albums_by_rank), albums(:lcd_soundsystem, :digitalism, :cut_copy))
  end

end
