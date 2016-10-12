class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id].to_i)
  end

  def new
    @newbook = Book.new
  end

  def create
    @newbook = Book.new

    @newbook.title = params[:book][:title]
    @newbook.author = params[:book][:author]
    @newbook.description = params[:book][:description]
    @newbook.rank = 0

    @newbook.save

    redirect_to action: 'index'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]

    @book.save

    redirect_to action: 'index'
  end

  def destroy
    Book.find(params[:id]).destroy

    redirect_to action: 'index'
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1
    @book.save

    # This ensures users stay on current page when hitting the upvote button_to
    # I think this is a better user experience :)
    redirect_to :back
  end
end
