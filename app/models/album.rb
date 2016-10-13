class Album < ActiveRecord::Base
  require 'sort_by_rank.rb'
  include SortByRank

  validates :name, presence: true
end
