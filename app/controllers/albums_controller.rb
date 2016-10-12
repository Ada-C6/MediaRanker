class AlbumsController < ApplicationController
    def index
        @albums = Album.all.order(rank: :desc)
    end

    def upvote
        @album = Album.find(params[:id])
        if @album.upvote_one
            redirect_to albums_path
        else
            #raise error
        end
    end
end
