class MoviesController < ApplicationController
    def index
        @movies = Movie.all.order(rank: :desc)
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        @movie.rank = 0
        if @movie.save  # successful
            redirect_to movies_path
        else  # unsuccessful, return to form with instance variables poplulated
            render :new
        end
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            redirect_to movie_path(@movie)
        else
            render :edit
        end
    end

    def upvote
        @movie = Movie.find(params[:id])
        if @movie.upvote_one
            redirect_to movies_path
        else
            #raise error
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_path
    end

    private

    def movie_params
        params.require(:movie).permit(:name, :director, :description)
    end
end
