class HomepageController < ApplicationController
  require 'sort_by_rank.rb'
  include SortByRank

  def index
    albums = sort_by_rank(Album.all)
      @albums = albums.first(5)
    books = sort_by_rank(Book.all)
      @books = books.first(5)
    movies = sort_by_rank(Movie.all)
      @movies = movies.first(5)
  end
end
