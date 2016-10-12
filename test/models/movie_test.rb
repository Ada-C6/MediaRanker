require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Activating upvote method adds 1 to the movie.ranking" do
      movie = movies(:top_gun)
      movie.upvote
      assert_equal movie.ranking, 1
  end
end
