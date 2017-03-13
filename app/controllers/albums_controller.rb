class AlbumsController < ApplicationController
  def index
    @items = Album.order(:rank).reverse_order # Get a list of all of the albums ordered by rank (high rank = more votes, so I'm getting the list in reverse_order)
    @item = @items.first
  end

  def show
    @item = Album.find(params[:id])
  end

  def new
    @item = Album.new
  end

  def create
    @item = Album.new(name: params[:album][:name], creator: params[:album][:creator], description: params[:album][:description])
    if @item.save
      redirect_to show_album_url(@item.id)
    else
      render :index_album
    end
  end

  def edit
    @item = Album.find(params[:id])
  end

  def update
    @item = Album.update(params[:id], {name: params[:album][:name], creator: params[:album][:creator], description: params[:album][:description]})
    redirect_to show_album_url(id: params[:id])
  end

  def destroy

    @item = Album.find(params[:id]) rescue ArgumentError.new("This id cannot by found")  #this allows for testing invalid intries in model_controller_test.rb
    @item.destroy

    redirect_to index_album_url
  end

  def upvote
    album = Album.find(params[:id])
    album.increment!(:rank) # auto saves
    redirect_to(:back)
  end

end
