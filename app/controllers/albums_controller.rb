class AlbumsController < ApplicationController
  def index
    @albums = Album.order(vote_count: :desc).all
  end

  def new
    @myalbum = Album.new
    @album_method = :post
    @album_path = albums_path
  end

  def show
    @myalbum = Album.find(params[:id])
    if @myalbum == nil
    render :file => 'public/404.html', :status => :not_found
    end
  end

  def create
    @myalbum = Album.new
    @myalbum.name = params[:album][:name]
    @myalbum.artist = params[:album][:artist]
    @myalbum.description = params[:album][:description]
    @myalbum.save
    redirect_to users_path(@myalbum.id)
  end

  def update
    @myalbum = Album.find(params[:id])
    if @myalbum == nil
      render :file => 'public/404.html', :status => :not_found
    end
    @myalbum.name = params[:album][:name]
    @myalbum.artist = params[:album][:artist]
    @myalbum.description = params[:album][:description]
    @myalbum.save
    redirect_to users_path(@myalbum.id)
  end

  def edit
    @myalbum = Album.find(params[:id])
    @album_method = :put
    @album_path = album_path
    if @myalbum == nil
      render :file => 'public/404.html',
      :status => :not_found
    end
  end

  def destroy
    @myalbum = Album.find(params[:id])
    @myalbum.destroy
    redirect_to users_path(@myalbum.id)
  end

  def upvote
    @myalbum = Album.find(params[:id])
    @myalbum.vote_count += 1
    @myalbum.save
    redirect_to :back
  end



end
