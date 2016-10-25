class MediaRankerController < ApplicationController

  def find_n_sort_all
    @movies = Movie.all.sort_by {|movie| movie.votes}.reverse
    @books = Book.all.sort_by {|book| book.votes}.reverse
    @albums = Album.all.sort_by {|album| album.votes}.reverse
  end

  def index
    find_n_sort_all
    @index_movies = @movies.take(10)
    @index_books = @books.take(10)
    @index_albums = @albums.take(10)
  end
end
