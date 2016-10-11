class AlbumsController < ApplicationController
  require 'sort_by_rank.rb'
  include SortByRank

  def index
    @albums = sort_by_rank(Album.all)
  end

  def create
    @album = Album.create(album_params)

    redirect_to albums_path
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_path
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id]).destroy

    redirect_to albums_path
  end

  ####### STRONG PARAMS #########

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description, :rank_points)
  end

end
