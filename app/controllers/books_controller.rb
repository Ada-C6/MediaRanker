class BooksController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.rank
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
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

  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:book_id])
    Book.upvote(@book)
    redirect_to book_path(@book)
  end

  private
  def book_params
      params.require(:book).permit(:name, :author, :description)
    end

  def find_params
    @book = Book.find(params[:id])
  end

end
