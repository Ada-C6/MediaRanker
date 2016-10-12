class HomeController < ApplicationController
    def index
        @albums = Album.all.order(rank: :desc)
        @books = Book.all.order(rank: :desc)
        @movies = Movie.all.order(rank: :desc)
    end
end
