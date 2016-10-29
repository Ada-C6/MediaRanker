class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    # want all movies to display on welcome page
  end

  def show

    @mymovie = Movie.find(params[:id].to_i)
    render :show

  end

  def new
    @mymovie = Movie.new
  end

  def create
    @mymovie = Movie.new
    @mymovie.name = params[:movie][:name]
    @mymovie.director = params[:movie][:director]
    @mymovie.description = params[:movie][:description]

    @mymovie.save
    # may need to change to movie specific page
    redirect_to movies_index_path
  end

  def edit
    @mymovie = Movie.find(params[:id])

  end

  def upvote
    # http://stackoverflow.com/questions/11499110/increment-vs-1
    # http://www.brownwebdesign.com/blog/ruby-on-rails-increment-and-decrement
    @mymovie = Movie.find(params[:id])

    @mymovie.increment!(:rankings)

    redirect_to movies_index_path
  end

  def update
    # big parameter list - use one argument per line
    @mymovie = Movie.find(params[:id])
    @mymovie.name = params[:movie][:name]
    @mymovie.director = params[:movie][:director]
    @mymovie.description = params[:movie][:description]
    @mymovie.save
    
    #may need to redirect to movie specific page
    redirect_to action: 'index'
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to action: 'index'
  end

end
