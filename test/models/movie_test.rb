require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Cannot create a movie without a name" do
    movie = Movie.new
    assert_not movie.valid?
    assert_includes movie.errors, :name
  end

  test "Create a movie with a name" do
    movies.each do |movie|
      assert_not_nil movie.name
      assert movie.valid?
    end
  end

  test "Cannot create a movie without a director" do
    movie = Movie.new
    assert_not movie.valid?
    assert_includes movie.errors, :director
  end

  test "Create a movie with a director" do
    movies.each do |movie|
      assert_not_nil movie.director
      assert movie.valid?
    end
  end

  test "Movie.sort_by_rank returns a list of movies sorted by rank in descending order" do
    assert_equal Movie.sort_by_rank.first, movies(:schindlers_list)
  end

  test "Movie.sort_by_rank places items with nil :rank at the bottom" do
    assert_equal Movie.sort_by_rank.last, movies(:nil_rank)
  end

  test "Movie.sort_by_rank returns all items in database" do
    assert_equal Movie.sort_by_rank.count, 4
  end
end
