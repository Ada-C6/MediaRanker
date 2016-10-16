class AlbumsController < ApplicationController
  require 'sort_by_rank.rb'
  require 'vote.rb'
  include SortByRank
  include Vote

  def index
    @albums = sort_by_rank(Album.all)
  end

  def new
    @album = Album.new
  end

  def create
    if album_params[:rank_points].nil?
      @album = Album.create!(name: album_params[:name], author: album_params[:author], description: album_params[:description], rank_points: 1)
    else
      @album = Album.create!(album_params)
    end

    redirect_to album_path(@album)
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

  def vote
    album = Album.find(params[:id])

    if params[:vote] == "up"
      add_vote(album).save
    elsif params[:vote] == "down"
      subtract_vote(album).save
    else
      raise
    end

    redirect_to albums_path
  end

  def destroy
    @album = Album.find(params[:id]).destroy

    redirect_to albums_path
  end

  ####### STRONG PARAMS #########

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description, :rank_points, :vote)
  end

end
