require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Movie must have a name, director, genre and rank" do
    assert movies(:mean_girls).valid? "Mean girls should be valid"

    movies(:mean_girls).title = nil  ## This name removal is local to the test data - it doesn't change the fixture
    assert_not movies(:mean_girls).valid? "Mean girls should no longer be valid"

    movies(:how_to_lose).rank = nil
    assert_not movies(:how_to_lose).valid? "How to Lose a Guy should no longer be valid"
  end
end
