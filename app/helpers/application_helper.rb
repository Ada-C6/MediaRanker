module ApplicationHelper
  def ranking(media)
    if media.rank.nil?
      return 0
    else
      return media.rank
    end
  end
end
