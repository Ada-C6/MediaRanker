require 'test_helper'
require 'vote.rb'
include Vote

class VoteTest < ActiveSupport::TestCase
  setup do
    @movie = Movie.create(name: "movieone", director: "jeff", rank_points: 0)
  end

  test "Vote should change rank_points by 1 if upvote" do
    add_vote(@movie)

    assert_equal(1, Movie.find(@movie.id).rank_points)
  end

  test "Vote should change rank_points by -1 if downvote" do
    subtract_vote(@movie)

    assert_equal(-1, Movie.find(@movie.id).rank_points)
  end
end
