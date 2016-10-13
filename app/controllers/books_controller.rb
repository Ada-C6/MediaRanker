class BooksController < ApplicationController
  def index
    @book = Book.all.order(:rank).reverse
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      @book.save
      redirect_to book_path
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1
    @book.save
    redirect_to books_path
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
