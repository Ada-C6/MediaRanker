class MediaRankerController < ApplicationController

  def find_n_sort_all
    @movies = Movie.all.sort {|a,b| b <=> a}
    @books = Book.all.sort {|a,b| b <=> a}
    @albums = Album.all.sort {|a,b| b <=> a}
  end

  def index
    find_n_sort_all
    @index_movies = @movies.take(10)
    @index_books = @books.take(10)
    @index_albums = @albums.take(10)
  end
end
