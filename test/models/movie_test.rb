require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "create a new movie with valid data" do
    assert movies(:one).valid?
    assert movies(:two).valid?
  end

  test "movie cannot be updated to not include valid data" do
    movie = movies(:one)
    movie.director = nil

    assert_not movie.valid?
        assert_not movie.save
        assert_includes movie.errors, :director
  end

  test "create a movie with invalid title fails" do
    no_title = Movie.new(director:"Julie", description: "The avant garde.")

    assert_not no_title.valid?
  end

  test "create a movie with invalid director fails" do
    no_director = Movie.new(title:"July", description: "It's the fourth!")

    assert_not no_director.valid?
  end

  test "create a movie with invalid description fails" do
    no_description = Movie.new(title:"Jude", director: "Law")

    assert_not no_description.valid?
  end

  test "top_ten returns 10 movies when there are 10 movies" do
    num_movies = Movie.count
    # I do not have a validation that titles need to be unique, so this will still work.
    until num_movies == 10 do
      Movie.create(title:"another", description:"a thing", director:"me")
      num_movies += 1
    end

    #now I have 10 movies.
    assert_equal Movie.top_ten.count, 10
  end

  test "top_ten returns all the movies when there are fewer than 10 movies" do
    num_movies = Movie.count
    # make sure there are less than 10 movies, but there are some.
    assert num_movies < 10 && num_movies >= 1

    assert_equal Movie.top_ten.count, Movie.count
  end

  test "top_ten returns 10 movies when there are more than 10 movies" do
    num_movies = Movie.count

    # I do not have a validation that titles need to be unique, so this will still work.
    until num_movies == 15 do
      Movie.create(title:"another", description:"a thing", director:"me")
      num_movies += 1
    end

    assert_equal Movie.top_ten.count, 10

  end

  test "top_ten returns a collection of no movies when there are no movies (not nil)" do
    # because of fixtures, I have to delete the existing movies before running this test
    num_movies = Movie.count

    if num_movies > 0
      Movie.destroy_all
    end

    assert_empty Movie.top_ten
    assert_not_nil Movie.top_ten
  end

  test "top_ten returns movies in descending order of rank" do
    ranked_movies = Movie.top_ten

    ranked_movies.each_with_index do |movie, i|
        assert movie.rank >= ranked_movies[i+1].rank
        # I want this to only keep going until the second to last movie, because there's nothing to compare the last movie to.
        break if i == ranked_movies.length-2
    end
  end
end
