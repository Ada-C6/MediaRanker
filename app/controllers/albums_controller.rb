class AlbumsController < ApplicationController
  require 'sort_by_rank.rb'
  include SortByRank

  def index
    @albums = Album.all
    @albums = sort_by_rank(@albums)
  end

  def create
    @market = Album.create(album_params)

    redirect_to albums_path
  end

  def new
    @market = Album.new
  end

  def edit
    @market = Album.find(params[:id])
  end

  def show
    @market = Album.find(params[:id])
  end

  def update
    @market = Album.find(params[:id])

    if @market.update(album_params)
      redirect_to album_path
    else
      render :edit
    end
  end

  def destroy
    @market = Album.find(params[:id]).destroy

    redirect_to albums_path
  end

  ####### STRONG PARAMS #########

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description, :rank_points)
  end

end
