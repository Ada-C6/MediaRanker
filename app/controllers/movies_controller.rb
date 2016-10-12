class MoviesController < ApplicationController
  def index
    @all_movies=Movie.order(rank: :desc)
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
    @movie_path= movies_url
  end

  def create
    @this_movie=Movie.new
    #set the values for attributes
    @this_movie.name = params[:movie][:name]
    @this_movie.director = params[:movie][:director]
    @this_movie.description = params[:movie][:description]
    @this_movie.rank = 1
    
    @this_movie.save
    
    redirect_to movie_url(@this_movie)
  end

  def destroy
    @this_movie=Movie.find(params[:id])
    @this_movie.destroy

    redirect_to movies_url
  end

  def upvote 
    @this_movie=Movie.find(params[:id])
    @this_movie.rank+=1
    @this_movie.save
  end
end
