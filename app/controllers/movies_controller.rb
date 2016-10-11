class MoviesController < ApplicationController
  def index
    @movies = Movie.order('votes DESC').first(10)

  end

  def all
    @movies = Movie.order('votes DESC').first(10)
  end

  def show
    @movie_id = params[:id].to_i
    @movie = Movie.find(@movie_id)
  end

  def edit
    @movie = Movie.find(params[:id].to_i)
  end

  def update
    @movie = Movie.find(params[:id].to_i)

    @movie.name = params[:movie][:name]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]

    @movie.save

    redirect_to action: 'show'
    # , id:@movie.id
  end

  def delete
    @movie = Movie.delete(params[:id].to_i)
    redirect_to action: 'index'
  end

  def upvote

    @movie = Movie.find(params[:id].to_i)
    Movie.increment_counter(:votes, params[:id])
    # @movie = Movie.find(params[:id].to_i)
    # @move.vote = params[]
    # @vote = @movie.votes
    # if @vote == nil
    #   @vote = 0
    # else
    #   @vote += 1
    # end

    # @vote.save
    redirect_to action: 'show'
  end


end
