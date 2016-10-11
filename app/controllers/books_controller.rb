class BooksController < ApplicationController


  def index
    @books = Book.all
  end

  def show
    @mybooks = Book.find(params[:id])
  end

  def new
    @mybooks = Book.new
    @book_method = :post
    @book_path = books_path
  end

  def create
    @mybooks = Book.new
    @mybooks.title = params[:book][:title]
    @mybooks.creator = params[:book][:creator]
    @mybooks.description = params[:book][:description]
    @mybooks.rank = params[:book][:rank]
    @mybooks.save
    redirect_to books_path
  end

  def edit
    @mybooks = Book.find(params[:id].to_i)
  end

  def update
    @mybooks = Book.find(params[:id])
    if @mybooks == nil
      render :file => 'public/404.html', :status => :not_found
    end
    @mybooks.title = params[:book][:title]
    @mybooks.creator = params[:book][:creator]
    @mybooks.description = params[:book][:description]
    @mybooks.rank = params[:book][:rank]
    @mybooks.save
    redirect_to books_show_path(@mybook.id)
  end



  def delete
  end
end
