module RankingModule

  extend ActiveSupport::Concern

    def all_ranked
      return self.order(upvotes: :desc)
    end

    def top_ten
      return self.order(upvotes: :desc).limit(10)
    end

end
