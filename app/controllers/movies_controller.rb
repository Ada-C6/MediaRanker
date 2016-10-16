class MoviesController < ApplicationController
  require 'sort_by_rank.rb'
  require 'vote.rb'
  include SortByRank
  include Vote

  def index
    @movies = sort_by_rank(Movie.all)
  end

  def create
    if movie_params[:rank_points].nil?
      @movie = Movie.create!(name: movie_params[:name], author: movie_params[:author], description: movie_params[:description], rank_points: 1)
    else
      @movie = Movie.create!(movie_params)
    end

    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

  def vote
    movie = Movie.find(params[:id])

    if params[:vote] == "up"
      add_vote(movie).save
    elsif params[:vote] == "down"
      subtract_vote(movie).save
    else
      raise
    end

    redirect_to movies_path
  end


  def destroy
    @movie = Movie.find(params[:id]).destroy

    redirect_to movies_path
  end

  ####### STRONG PARAMS #########

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description, :rank_points, :vote)
  end
end
