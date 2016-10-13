class AlbumsController < ApplicationController
  def index
    @albums = Album.order(rank: :desc).all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(title: params[:album][:title], artist: params[:album][:artist], synopsis: params[:album][:synopsis])
    @album.rank = 0
    @album.save

    redirect_to index_albums_url
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.update(params[:id], title: params[:album][:title], artist: params[:album][:artist], synopsis: params[:album][:synopsis])

    redirect_to index_albums_url
  end

  def upvote
    @album = Album.find(params[:id])
    @album.increment!(:rank)

    redirect_to index_albums_url
  end

  def destroy
    Album.destroy(params[:id])

    redirect_to index_albums_url
  end

end
