class AlbumsController < ApplicationController
    def index
        @albums = Album.all.order(votes: :desc)
    end

    def new
        @album = Album.new
    end

    def create
        @album = Album.new(album_params)
        if @album.save  # successful
            redirect_to albums_path
        else  # unsuccessful, return to form with instance variables poplulated
            render :new
        end
    end

    def show
        @album = Album.find(params[:id])
    end

    def edit
        @album = Album.find(params[:id])
    end

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            redirect_to album_path(@album)
        else
            render :edit
        end
    end

    def upvote
        @album = Album.find(params[:id])
        if @album.upvote_one
            redirect_to albums_path
        else
            #raise error
        end
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to albums_path
    end

    private

    def album_params
        params.require(:album).permit(:name, :artist, :description)
    end
end
