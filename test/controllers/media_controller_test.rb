require 'test_helper'

class MediaControllerTest < ActionController::TestCase
  test "should provide a list of movies, books, and albums" do
    movie_list = assigns(:movies)
    # book_list = assigns(:books)
    # album_list = assigns(:albums)

    puts "MOVIE LIST!!!!!!!! #{movie_list}!!!"

    # assert_includes(movie_list, movies(:nightmare))

  end

end
