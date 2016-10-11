class MoviesController < ApplicationController
  def index
    @all_movies = Movie.all
    # @all_movies.sort
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render edit_movie_path
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    if @movie.ranking == nil #from when I had nil values for ranking
      @movie.ranking = 0
      @movie.ranking += 1
      @movie.save
    else
    @movie.ranking += 1
    @movie.save
    end
    redirect_to movie_path(@movie)
  end


  private
  def movie_params #will permit and require params we trust
  params.require(:movie).permit(:name, :director, :description,)
  end

end
