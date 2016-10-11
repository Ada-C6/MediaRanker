class MoviesController < ApplicationController
  def index
  end

  def show
    @this_movie=Movie.find(params[:id])
  end

  def edit
    @this_movie=Movie.find(params[:id])
    @movie_method= :put
    @movie_path= movie_url(@this_movie)
    
  end

  def update
    @this_movie=Movie.find(params[:id])
    
    @this_movie.name = params[:movie][:name]
    @this_movie.director = params[:movie][:director]
    @this_movie.description = params[:movie][:description]

    @this_movie.save

    redirect_to movie_url(@this_movie)
  end

  def new
    @this_movie=Movie.new
    @movie_method= :post
    @movie_path= movie_url(@this_movie)
  end

  def create
    @this_movie=Movie.new
    #set the values for attributes
    @this_movie.name = params[:movie][:name]
    @this_movie.director = params[:movie][:director]
    @this_movie.description = params[:movie][:description]
    
    @this_movie.save
    
    redirect_to movie_url(@this_movie)
  end

  def destroy
  end

  def upvote 
    @this_movie=Movie.find(params[:id])
    @this_movie.rank+=1
    @this_movie.save
  end
end
