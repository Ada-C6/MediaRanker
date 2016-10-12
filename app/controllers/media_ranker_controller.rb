class MediaRankerController < ApplicationController

  def find_n_sort_all
    @movies = Movie.all.sort {|a,b| a <=> b}
    @books = Book.all.sort {|a,b| a <=> b}
    @albums = Album.all.sort {|a,b| a <=> b}
  end

  def index
    find_n_sort_all
    @index_movies = @movies.take(10)
    @index_books = @books.take(10)
    @index_albums = @albums.take(10)
  end
end
