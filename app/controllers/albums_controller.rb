class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @album_method = :post
    @album_path = "/albums"
  end

  def create
    @album = Album.new
    @album.name = params[:album][:name]
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]
    @album.rank = 0
    if @album.save
      redirect_to album_path(@album.id)
    else
      redirect_to new_album_path
    end
  end

  def edit
    @album = Album.find(params[:id])
    @album_method = :put
    @album_path = album_path
  end

  def update
    Album.update(params[:id], :name => params[:album][:name],
                              :artist => params[:album][:artist],
                              :description => params[:album][:description])
    redirect_to album_path
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.upvote
    redirect_to album_path
  end
end
