require 'test_helper'
require 'sort_by_rank.rb'
include SortByRank

class SortByRankTest < ActiveSupport::TestCase
  # 
  # test "The first in the list should be greater than the last" do
  #   collect = [
  #     Album.new(name:"Sdf", artist: "lskdjf", rank_points: 8),
  #     Book.new(name:"sat", author: "sdsdf", rank_points: 6),
  #     Movie.new(name: "k", director: "well", rank_points: 19)
  #   ]
  #
  #   sort_by_rank(collect)
  #
  #   assert_operator collect[1].rank_points, :>,  collect[-1].rank_points
  # end
end
