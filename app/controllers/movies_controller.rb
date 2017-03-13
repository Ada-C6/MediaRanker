class MoviesController < ApplicationController
  def index
    @items = Movie.order(:rank).reverse_order # Get a list of all of the movies ordered by rank (high rank = more votes, so I'm getting the list in reverse_order)
    @item = @items.first
  end

  def show
    @item = Movie.find(params[:id])
  end

  def new
    @item = Movie.new
  end

  def create
    @item = Movie.new(name: params[:movie][:name], creator: params[:movie][:creator], description: params[:movie][:description])
    @item.save

    redirect_to show_movie_url(@item.id)
    # redirect_to index_movie_url
  end

  def edit
    @item = Movie.find(params[:id])
  end

  def update
    @item = Movie.update(params[:id], {name: params[:movie][:name], creator: params[:movie][:creator], description: params[:movie][:description]})
    redirect_to show_movie_url(id: params[:id])
  end

  def destroy
    @item = Movie.find(params[:id]) rescue ArgumentError.new("This id cannot by found")  #this allows for testing invalid intries in model_controller_test.rb
    @item.destroy

    redirect_to index_movie_url
  end

  def upvote
    movie = Movie.find(params[:id])
    movie.increment!(:rank) # auto saves
    redirect_to(:back)
  end

end
