require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create a movie with no name" do
    movie = Movie.new
    assert_not movie.valid?
  end

  test "orders movie by most votes" do
    popular = Movie.most_votes
    assert_equal  popular.first, movies(:selena)
  end
end
