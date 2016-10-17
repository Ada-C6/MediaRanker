require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "Can create a movie with all fields" do
    movie = movies(:Harry_Potter)

    assert movie.valid?
  end

  test "Cannot create a movie with missing name" do
    movie = movies(:Movie_no_name)

    assert_not movie.valid?
  end

  test "Cannot create a movie with missing description" do
    movie = movies(:Movie_no_desc)

    assert_not movie.valid?
  end

  test "Cannot create a movie with missing upvotes" do
    movie = movies(:Movie_no_upvotes)
    movie.upvotes = nil

    assert_not movie.valid?
  end

  test "Cannot create a movie with negative upvotes" do
    movie = movies(:Movie_negative_upvotes)

    assert_not movie.valid?
  end

  test "Cannot create the same movie twice" do
    movie = movies(:Harry_Potter)
    movie1 = Movie.new(name: 'Harry Potter and the Goblet of Fire', director: 'JK Rowling', description: 'Magic and Patronuses!', upvotes: 0)

    assert movie.valid?
    assert_not movie1.valid?
  end

  test "Can rename a movie" do
    movie = movies(:Rename_movie)
    movie.name = "Batman"

    assert movie.valid?
  end

  test "Cannot rename a movie to duplicate an existing movie" do
    movie = movies(:Named_movie)

    movie1 = movies(:Cant_rename_movie)
    movie1.name = "Batman"

    assert movie.valid?
    assert_not movie1.valid?
  end

  test "The method upvote will increase the Movie's upvotes by 1" do
    movie = movies(:Harry_Potter)
    upvotes = movie.upvotes
    assert_equal(upvotes, 0)

    movie.upvote
    upvotes = movie.upvotes
    assert_equal(upvotes, 1)
  end

end
