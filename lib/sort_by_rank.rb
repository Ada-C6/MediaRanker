module SortByRank
  def sort_by_rank(array)
    array.order(rank_points: :desc)
  end
end
