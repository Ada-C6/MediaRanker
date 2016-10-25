class AlbumsController < ApplicationController
def index
    @all_albums=Album.order(rank: :desc)
  end

  def show
    @this_album=Album.find(params[:id])
  end

  def edit
    @this_album=Album.find(params[:id])
    @album_method= :put
    @album_path= album_url(@this_album)
    
  end

  def update
    @this_album=Album.find(params[:id])
    
    @this_album.name = params[:album][:name]
    @this_album.artist = params[:album][:artist]
    @this_album.description = params[:album][:description]

    @this_album.save

    redirect_to album_url(@this_album)
  end

  def new
    @this_album=Album.new
    @album_method= :post
    @album_path= albums_url
  end

  def create
    @this_album=Album.new
    #set the values for attributes
    @this_album.name = params[:album][:name]
    @this_album.artist = params[:album][:artist]
    @this_album.description = params[:album][:description]
    @this_album.rank = 1
    
    @this_album.save
    
    redirect_to album_url(@this_album)
  end

  def destroy
    potential=Album.find_by_id(params[:id]) 
    
    unless potential==nil 
      @this_album=potential
      @this_album.destroy
      redirect_to albums_url
    end
  end

  def upvote
    @this_album=Album.find(params[:id])
    @this_album.rank+=1
    
    @this_album.save
    
    redirect_to :back
  end

  def downvote
    @this_album=Album.find(params[:id])
    @this_album.rank-=1
    
    @this_album.save
    
    redirect_to :back
  end
end
