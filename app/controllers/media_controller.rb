class MediaController < ApplicationController
  def index
  	@topMovies=Movie.all(where)
  end
end
