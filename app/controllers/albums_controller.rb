class AlbumsController < ApplicationController
    def index
        @albums = Album.all.order(rank: :desc)
    end

    def upvote
        @album = Album.find(params[:id])
        @album.upvote_one
        @album.save
        redirect_to albums_path
    end
end
