class BooksController < ApplicationController
  def index
    @books = Book.all.order(:ranked).reverse
  end

  def show
    begin
      @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render "/errors/not_found", status: :not_found
    end
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
      redirect_to book_path(@book.id)
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
    @book.save

    redirect_to book_path(@book.id)
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description, :ranked)
  end
end
