class BooksController < ApplicationController
    def index
      @books = Book.all.order(ranking: :desc)
    end
end
