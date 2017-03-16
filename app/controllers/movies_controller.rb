class MoviesController < ApplicationController
  def index
    @movies = Movie.order('num_votes DESC, id')
  end

  def show
    find
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new

    @movie.title = params[:movie][:title]
    @movie.num_votes = 0
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]

    @movie.save

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      redirect_to new_movie_path
    end
  end

  def upvote
    find

    @movie.num_votes += 1
    @movie.save

    redirect_to :back
  end

  def edit
    find
  end

  def update
    find

    @movie.title = params[:movie][:title]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]

    @movie.save

    redirect_to movie_path(@movie.id)
  end

  def destroy
    find

    if @movie.class == Movie
      @movie.destroy
      redirect_to movies_path
    end
  end

  private
  def find
    if Movie.exists?(params[:id].to_i)
      @movie = Movie.find(params[:id])
    else
      render status: 404
    end
  end
end
