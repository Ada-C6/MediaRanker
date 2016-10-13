module Vote
  def subtract_vote(record)
    record.rank_points -= 1
    return record
  end

  def add_vote(record)
    record.rank_points += 1
    return record
  end

end
