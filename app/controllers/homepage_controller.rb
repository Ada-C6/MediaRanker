class HomepageController < ApplicationController
  require 'sort_by_rank.rb'
  include SortByRank

  def index
    @albums = sort_by_rank(Album.all)
    @books = sort_by_rank(Book.all)
    @movies = sort_by_rank(Movie.all)
  end
end
