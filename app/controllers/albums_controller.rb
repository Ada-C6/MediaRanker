class AlbumsController < ApplicationController
  before_action :find_album, except: [:new, :create, :index]

  def index
    @albums = Album.all
  end

  def show

  end

  def new
    @myalbum = Album.new
    @album_method = :post
    @album_path = albums_path
  end

  def create
    @myalbum = Album.new
    @myalbum.title = params[:album][:title]
    @myalbum.creator = params[:album][:creator]
    @myalbum.description = params[:album][:description]
    @myalbum.save
    redirect_to albums_path
  end

  def edit

    @album_method = :put
    @albums_path = edit_album_path(@myalbum.id)
    if @myalbum == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update

    if @myalbum == nil
      render :file => 'public/404.html', :status => :not_found
    end
    @myalbum.title = params[:album][:title]
    @myalbum.creator = params[:album][:creator]
    @myalbum.description = params[:album][:description]
    @myalbum.rank = params[:album][:rank]
    @myalbum.save
    redirect_to album_path(@myalbum.id)
  end



  def destroy

    @myalbum.destroy
    redirect_to albums_path
  end

  def upvote

    @myalbum.upvote
    redirect_to albums_path
  end

  private

  def find_album
    @myalbum = Album.find(params[:id])
  end

  end#end of class
