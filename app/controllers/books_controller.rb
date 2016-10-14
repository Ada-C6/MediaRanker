class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
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
      redirect_to books_path
    else
      render :edit
    end
  end

  def delete
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1
    @book.save
    redirect_to :back
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description) #do i want :rank ?
  end


end
