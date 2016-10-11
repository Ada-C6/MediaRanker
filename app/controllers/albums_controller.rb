class AlbumsController < ApplicationController
  
  def find_album
    return Album.find(params[:id].to_i)
  end

  def index
    @albums = Album.all
  end

  def new
    @my_album = Album.new
    @post_method = :post
    @post_path = create_album_path
  end

  def create
    @params = params
    @my_album.name = params[:album][:name]
    @my_album.artist = params[:album][:artist]
    @my_album.description = params[:description]
    @my_album.ranking = 0
    if @my_album.save
      redirect_to index_albums_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = create_album_path
      render :new
    end
  end

  def show
    @my_album = find_album
  end

  def edit
    @my_album = find_album
    @post_method = :put
    @post_path = update_album_path
  end

  def update
    @params = params
    @my_album = find_album

    if @my_album == nil
        render :file => 'public/404.html',
            :status => :not_found
    end  

    @my_album.name = params[:album][:name]
    @my_album.artist = params[:album][:artist]
    @my_album.description = params[:description]
    @my_album.ranking = 0  

    if @my_album.save
      redirect_to index_albums_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :put
      @post_path = update_album_path
      render :new
    end    
  end

  def delete
    @my_album = find_album
    if @my_album != nil
      @my_album.destroy
      redirect_to index_albums_path
    end    
  end

  def show_all
  end

  def upvote
  end
end
