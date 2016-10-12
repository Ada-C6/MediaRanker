class MoviesController < ApplicationController
    def index
        @movies = Movie.all.order(rank: :desc)
    end

    def upvote
        @movie = Movie.find(params[:id])
        if @movie.upvote_one
            redirect_to movies_path
        else
            #raise error
        end
    end
end
