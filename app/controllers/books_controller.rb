class BooksController < ApplicationController

  def index
    @books = Book.all
    @books = @books.order(ranking: :desc)
  end

  def show
    begin
      @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
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
      redirect_to book_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.upvote
    redirect_to book_path(params[:id])
  end
  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
