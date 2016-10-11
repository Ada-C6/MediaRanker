class BooksController < ApplicationController
    def index
      @books = Book.all.order(ranking: :desc)
    end

    def show
      @book = Book.find(params[:id])
    end
end
