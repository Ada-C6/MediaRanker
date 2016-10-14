module SortByRank

  def sort_by_rank(array)
    array.map do |record|
      if record.rank_points.nil?
        record.rank_points = 0
      else
        record
      end
    end

    array.order(rank_points: :desc)
  end
end
