class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @myalbum = Album.new
    #@album_method = :post
    #@album_path = album_create_path
  end

  def show
    @myalbum = Album.find(params[:id])
    if @myalbum == nil
    render :file => 'public/404.html', :status => :not_found
    end
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
