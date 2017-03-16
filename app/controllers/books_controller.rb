class BooksController < ApplicationController
  def index
    @books = Book.order('num_votes DESC, id').limit(10)
  end

  def show
    find
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new

    @book.title = params[:book][:title]
    @book.num_votes = 0
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]

    @book.save

    if @book.save
      redirect_to book_path(@book.id)
    else
      redirect_to new_book_path
    end
  end

  def upvote
    find

    @book.num_votes += 1
    @book.save

    redirect_to :back
  end

  def edit
    find
  end

  def update
    find

    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]

    @book.save

    redirect_to book_path(@book.id)
  end

  def destroy
    find

    if @book.class == Book
      @book.destroy
      redirect_to books_path
    end
  end

  private
  def find
    if Book.exists?(params[:id].to_i)
      @book = Book.find(params[:id].to_i)
    else
      render status: 404
    end
  end
end
