class BooksController < ApplicationController
    def index
        @books = Book.all.order(rank: :desc)
    end

    def upvote
        @book = Book.find(params[:id])
        if @book.upvote_one
            redirect_to books_path
        else
            #raise error
        end
    end
end
