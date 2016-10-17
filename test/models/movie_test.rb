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

  test "self.order_descending should order the movies highest to lowest" do
    ordered = Movie.order_descending

    assert_equal "Jazz", ordered[0].title
    assert_equal "Classical", ordered[1].title
    assert_equal "Valid Movie", ordered.last.title
  end

  test "self.top_ten should return only 10 highest movies in order" do
    top = Movie.top_ten

    assert_equal 10, top.length
    assert_equal "Jazz", top[0].title
    assert_equal "R&B", top.last.title
  end
end
