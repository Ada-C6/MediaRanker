class MediaController < ApplicationController
  def index
  	@top_movies=Movie.order(rank: :desc).limit(10)
  	@top_books=Book.order(rank: :desc).limit(10)
  	@top_albums=Album.order(rank: :desc).limit(10)
  end
end
