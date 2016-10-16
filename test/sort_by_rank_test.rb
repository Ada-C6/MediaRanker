require 'test_helper'
require 'sort_by_rank.rb'
include SortByRank

class SortByRankTest < ActiveSupport::TestCase
  setup do
    @collection = [
      Movie.create(name: "movieone", director: "jeff", rank_points: 0),
      Movie.create(name: "movietwo", director: "allison", rank_points: nil),
      Movie.create(name: "moviethree", director: "personface", rank_points: 1)
    ]
  end

  test "The first in the list should be greater than or equal to the last" do
    movies = sort_by_rank(@collection)

    assert_operator movies[0].rank_points, :>=,  movies[-1].rank_points
  end

  test "Sort By Rank should change nil rank points to 0" do
    movie = @collection[1]
    sort_by_rank(movie)
    assert_equal 0, movie.rank_points
  end

  test "Sort By Rank should work on a single record" do
    assert_nothing_raised do
      sort_by_rank(@collection[0])
    end
  end
end
