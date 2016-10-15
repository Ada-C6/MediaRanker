require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "A valid entry will save" do
    movie = movies(:valid_movie)

    assert movie.save
    assert movie.valid?
  end

  test "validations: movie director can't be blank" do
    movie = Movie.new(title: "New Movie")

    assert_not movie.save
    assert_not movie.valid?
    assert movie.errors.keys.include?(:director), "director is not in the errors hash"
  end

  test "validations: movie title can't be blank" do
    movie = Movie.new(director: "Allison")

    assert_not movie.save
    assert_not movie.valid?
    assert movie.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "validations: movie title must be unique" do
    movie = movies(:valid_movie)
    assert movie.save

    movie2 = Movie.new(title: "Valid Movie", director: "Allison")
    assert_not movie2.save
    assert_not movie2.valid?
    assert movie2.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "#upvote: should increase the rank value by 1" do
    movie = movies(:valid_movie)

    assert movie.save
    assert movie.upvote
    assert movie.save
    assert_equal movie.rank, 1, "Rank value did not increase by 1"
  end
end
