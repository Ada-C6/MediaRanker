module Vote
  def add_vote(record)
    record.rank_points += 1
    record.save
    return record
  end

  def subtract_vote(record)
    record.rank_points -= 1
    record.save
    return record
  end
end
