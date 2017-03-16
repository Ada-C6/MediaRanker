class PagesController < ApplicationController
  def home
    # @top_movies = @movies.sort_by { |movie_hash| [movie_hash[:num_votes], (-movie_hash[:id])] }.reverse.take(10)

    @top_movies = Movie.order('num_votes DESC, id').limit(10)

    @top_books = Book.order('num_votes DESC, id').limit(10)

    @top_albums = Album.order('num_votes DESC, id').limit(10)
  end
end
