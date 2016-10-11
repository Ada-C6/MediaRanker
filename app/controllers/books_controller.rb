class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
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
  end

  def update
  end

  def destroy
  end

  def upvote
  end
end
