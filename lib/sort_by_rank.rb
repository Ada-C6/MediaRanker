module SortByRank

  def sort_by_rank(unsorted)
    begin
      unsorted.count
    rescue NoMethodError
      if unsorted.rank_points.nil?
        unsorted.rank_points = 0
        return unsorted
      else
        return unsorted
      end
    else
      unsorted.map do |record|
        if record.rank_points.nil?
          record.rank_points = 0
        else
          record
        end
      end
      
      unsorted.sort_by { |record| record.rank_points }.reverse!
    end
  end
end
