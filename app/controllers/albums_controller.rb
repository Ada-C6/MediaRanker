class AlbumsController < ApplicationController
    def index
        @albums = Album.all.order(rank: :desc)
    end

    def new
        @album = Album.new
    end

    def create
        @album = Album.new(album_params)
        @album.rank = 0
        if @album.save  # successful
            redirect_to albums_path
        else  # unsuccessful, return to form with instance variables poplulated
            render :new
        end
    end

    def show
        @album = Album.find(params[:id])
    end

    def upvote
        @album = Album.find(params[:id])
        if @album.upvote_one
            redirect_to albums_path
        else
            #raise error
        end
    end

    private

    def album_params
        params.require(:album).permit(:name, :artist, :description)
    end
end
