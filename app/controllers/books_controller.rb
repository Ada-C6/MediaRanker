class BooksController < ApplicationController
    def index
      @books = Book.all.order(ranking: :desc)
    end

    def show
      @book = Book.find(params[:id])
    end


    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end

    def upvote
      @book = Book.find(params[:id])
      @book.ranking += 1
      @book.save
      redirect_to book_path(@book)
    end
end
