class AlbumsController < ApplicationController
  def index
    @album = Album.order(rank: :desc).limit(10)
  end

  def show
    @album = Album.find(params[:id].to_i)
  end

  def new
    @album = Album.new
    @path = albums_path
  end

  def create
    @params = params
    @album = Album.new
    @album.title = params[:album][:title]
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]
    @album.rank = 0
    @album.save
    redirect_to action: 'index'
  end

  def edit
    @album = Album.find(params[:id].to_i)
    @path = album_path
  end

  def update
    @album = Album.find(params[:id].to_i)
    @params = params
    @album.title = params[:album][:title]
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]
    @album.save
    redirect_to action: 'show'
  end

  def upvote
    @album = Album.find(params[:id].to_i)
    @album.rank += 1
    @album.save

    redirect_to :back
  end

  def destroy
    @album = Album.find(params[:id].to_i)
    @album.destroy

    redirect_to albums_path
  end
end
