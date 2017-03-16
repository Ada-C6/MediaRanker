class PagesController < ApplicationController
  def home
    # Sort by num_votes (which is lowest to highest) then by negative id (because first I want the newest on top) and then I run reverse so the result it highest upvotes and highest id (aka newest)

    # @top_movies = @movies.sort_by { |movie_hash| [movie_hash[:num_votes], (-movie_hash[:id])] }.reverse.take(10)

    @top_movies = Movie.order('num_votes DESC, id').limit(10)

    @top_books = Book.order('num_votes DESC, id').limit(10)

    @top_albums = Album.order('num_votes DESC, id').limit(10)
  end
end
