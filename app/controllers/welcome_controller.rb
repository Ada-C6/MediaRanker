class WelcomeController < ApplicationController
  def index
    # localhost:3000 by itself without anything else in the url is the root (or '/') route and is always going to go to WelcomeController.index

    @movies = Movie.all
    @books = Book.all
    @albums = Album.all

    #so if you want books and albums on the home page, you need to set @books and @albums in the same way as the above @movies

    # your route for '/' goes to welcome controller, index method
    # which is here
    # you're not setting @books here so the view gets no books
    # want all movies to display on welcome page
  end

  def show
    @mymovie = Movie.find(params[:id].to_i)
  end

  def new
    @mymovie = Movie.new
  end

  def create
    @mymovie = Movie.new
    @mymovie.name = params[:movie][:name]
    @mymovie.director = params[:movie][:director]
    @mymovie.description = params[:movie][:description]
    @mymovie.ranking = params[:movie][:ranking]

    @mymovie.save
    # may need to change to movie specific page
    redirect_to root_path
  end


  def edit
    @mymovie = Movie.find(params[:id])

  end


  def update
    # big parameter list - use one argument per line
    Movie.update(
      params[:id],
      name: params[:movie][:name],
      director: params[:movie][:director],
      description: params[:movie][:description],
      ranking:params[:movie][:ranking])
    
    #may need to redirect to movie specific page
    redirect_to action: 'index'
  end


  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to action: 'index'

  end
end
