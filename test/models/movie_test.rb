require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "Create a movie with valid data" do
    movie = Movie.new(name: "foo", director: "bar")
    assert movie.valid?
  end

  test "Create two movies with different names" do
    assert movies(:do_the_right_thing).valid?
    assert movies(:pans_labyrinth).valid?
  end

  test "Cannot create two movies with the same name" do
    movie_one = Movie.create!(name: "25th Hour", director: "Spike Lee")
    movie_two = Movie.new(name: "25th Hour", director: "Spike Lee")
    assert_not movie_two.valid?
  end

  test "Cannot create a movie with no name" do
    movie = Movie.new(director: "bar")
    assert_not movie.valid?
  end

  test "Cannot create a movie with no director" do
    movie = Movie.new(name: "foo")
    assert_not movie.valid?
  end
end
