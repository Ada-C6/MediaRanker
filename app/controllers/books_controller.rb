class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.rank = 0
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    begin
      @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render status: :not_found #or render an error view page that you create by render '/errors/not_found', :not_found
    end
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

  def destroy
    @book = Book.find(params[:id]).destroy

    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.upvote
    @book.save

    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
