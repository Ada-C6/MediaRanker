class BooksController < ApplicationController
    def index
        @books = Book.all.order(votes: :desc)
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save  # successful
            redirect_to books_path
        else  # unsuccessful, return to form with instance variables poplulated
            render :new
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def upvote
        @book = Book.find(params[:id])
        if @book.upvote_one
            redirect_to books_path
        else
            #raise error
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:name, :author, :description)
    end
end
