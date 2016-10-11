class BooksController < ApplicationController

  def index
    @books = Book.all
    # Right now the order of the books is the order they're in the database. I will need to sort them by their ranking at some point. Woooo, mergesort? maybe here, maybe in the model. Go look at that article we read about how to move things to the model. 
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    @book.save
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1

    @book.save
    #this stores the current page in the session hash, so that I can then redirect to the same page that this completed action is called from. It also cleans it up by deleting it after it's done.
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end


  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
