class BooksController < ApplicationController

  def index
    @books = Book.all
    # want all books to display on welcome page
  end

  def show
    @mybook = Book.find(params[:id].to_i)
    render :show
  end

  def new
    @mybook = Book.new
  end

  def create
    @mybook = Book.new
    @mybook.name = params[:book][:name]
    @mybook.author = params[:book][:author]
    @mybook.description = params[:book][:description]

    @mybook.save
    # may need to change to book specific page
    redirect_to books_index_path
  end


  def edit
    @mybook = book.find(params[:id])
  end

  def upvote
    # http://stackoverflow.com/questions/11499110/increment-vs-1
    # http://www.brownwebdesign.com/blog/ruby-on-rails-increment-and-decrement
    @mybook = Book.find(params[:id])

    @mybook.increment!(:rankings)

    redirect_to books_index_path
  end

  def update
    # big parameter list - use one argument per line
    Book.update(
      params[:id],
      name: params[:book][:name],
      director: params[:book][:author],
      description: params[:book][:description])
    
    #may need to redirect to book specific page
    redirect_to action: 'index'
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to action: 'index'
  end
  
end
