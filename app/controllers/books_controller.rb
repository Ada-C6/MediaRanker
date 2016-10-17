class BooksController < ApplicationController
  def index
    @books = Book.all.order(:ranking).reverse
  end

  def create
    @book = Book.new(book_params)
    @book.ranking = 0
    @book.save
    redirect_to books_path
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def upvote
      @book = Book.find(params[:id])
      @book.ranking += 1
      @book.save
      redirect_to book_path
  end

  def destroy
    @book = Book.find(params[:id]).destroy

    redirect_to books_path
  end

####### STRONG PARAMS ##############
  private
  def book_params
    params.require(:book).permit(:id, :name, :author, :description, :ranking)
  end
end
