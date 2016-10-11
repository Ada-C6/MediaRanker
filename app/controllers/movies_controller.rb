class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @mymovie = Movie.new
    # @movie_method = :post
    # @movie_path = movie_create_path
  end

  def create

  end

  def show
    @mymovie = Movie.find(params[:id])
    if @mymovie == nil
        render :file => 'public/404.html', :status => :not_found
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
