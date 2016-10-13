class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:rank).reverse_order
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    @movie.save
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    Movie.find(params[:id]).destroy

    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1

    @movie.save
    #this stores the current page in the session hash, so that I can then redirect to the same page that this completed action is called from. It also cleans it up by deleting it after it's done.
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :director, :description)
  end

end
