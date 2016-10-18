class BooksController < ApplicationController
  def index
    @books = Book.order(rank: :desc).all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(title: params[:book][:title], author: params[:book][:author], synopsis: params[:book][:synopsis])
    @book.rank = 0
    @book.save

    redirect_to index_books_url
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.update(params[:id], title: params[:book][:title], author: params[:book][:author], synopsis: params[:book][:synopsis])

    redirect_to index_books_url
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:rank)

    redirect_to show_books_url
  end

  def destroy
    Book.destroy(params[:id])

    redirect_to index_books_url
  end

end
