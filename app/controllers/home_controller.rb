class HomeController < ApplicationController
    def index
        @albums = Album.all.order(votes: :desc)
        @books = Book.all.order(votes: :desc)
        @movies = Movie.all.order(votes: :desc)
    end
end
