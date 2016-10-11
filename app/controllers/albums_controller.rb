class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @myalbums = Album.find(params[:id])
  end


  def new
    @myalbums = Album.new
  end

  def create
  end

  def edit
    @myalbums = Album.find(params[:id].to_i)
  end

  def update
    @myalbums = Album.find(params[:id])
  end



  def delete
  end
end
