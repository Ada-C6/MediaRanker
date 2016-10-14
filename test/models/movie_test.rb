require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Movie must have a name" do
    assert_not movies("without_a_name").valid?
  end

  test "Movie must have some sort of rank point value" do
    assert_not movies("without_rank_points").valid?
  end

  test "Movie must have a director" do
    assert_not movies("without_a_director").valid?
  end

  test "Movie can have negative points" do
    movie = movies("correct_movie")
    movie.rank_points -= 2
    assert_equal(-1, movie.rank_points)
    assert movie.valid?
  end
end
