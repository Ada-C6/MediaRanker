require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Movie must have a name" do
    movie = movies("without_a_name")
    movie.name = nil

    assert_not movie.valid?
  end

  test "Movie must have some sort of rank point value" do
    movie = movies("without_rank_points")
    movie.rank_points = nil

    assert_not movie.valid?
  end

  test "Movie must have an director" do
    movie = movies("without_a_director")
    movie.director = nil

    assert_not movie.valid?
  end

  test "Movie can have negative points" do
    movie = movies("correct_movie")
    movie.rank_points -= 100

    assert_operator movie.rank_points, :<, 0
    assert movie.valid?
  end
end
