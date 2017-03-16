class MoviesController < ApplicationController

  def movie
    @movie ||= Movie.find(params[:id].to_i)
  end

  def index
    @movies = Movie.order(:votes).reverse_order
  end

  def show
    movie
  end

  def edit
    movie
  end

  def update
    movie.update_attributes(movie_params)
    redirect_to movie_path
  end

  def new
    @movie = Movie.new
  end

  def destroy
    if Movie.exists?(params[:id].to_i)
      movie.destroy
      redirect_to :movies
    else
      flash[:notice] = "That movie does not exist."
      redirect_to :movies
    end
  end

  def create
    @movie = Movie.new(name:params[:movie][:name],
                     director:params[:movie][:director],
                     description:params[:movie][:description],
                     votes: 0)
    @movie.save
    redirect_to :movies
  end

  def up_vote
    movie.update_attribute(:votes, (movie.votes + 1))
    redirect_to(request.referer)
  end

private
 def movie_params
   params.require(:movie).permit( :name, :director, :description, :votes)
 end
end
