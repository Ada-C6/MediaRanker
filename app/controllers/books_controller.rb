class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @mybook = Book.new
  end

  def show
    @mybook = Book.find(params[:id])
    if @mybook == nil
      render :file => 'public/404.html', :status => :not_found
    end 
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
