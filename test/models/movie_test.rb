require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Create a movie with valid data" do
    movie = movies(:one)
    assert movie.valid?

    movie1 = Movie.new(title: "Star Trek")

    assert movie1.save
  end

  test "Cannot create an unnamed movie" do
    movie = Movie.new
    assert_not movie.valid?
    assert_includes movie.errors, :title

  end

  test "Cannot create two movies with different names" do
    movie1 = movies(:one)
    movie2 = Movie.new(title: "Wrath of Khan")

    assert_not movie2.valid?
  end

  test "Vote attribute must be zero or a positive integer" do
    movie1 = Movie.new(title: "Test", vote: -1)
    movie2 = movies(:two)
    movie3 = movies(:three)

    assert_not movie1.valid?
    assert_not movie1.save

    assert movie2.valid?
    assert movie3.valid?
  end

  test "Increases vote by one when upvote is called" do
    movie = movies(:two)
    assert_equal movie.upvote, 1002
    assert_not_equal movie.upvote, 14

  end
end
