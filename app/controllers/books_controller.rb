class BooksController < ApplicationController
  def index
    @items = Book.order(:rank).reverse_order # Get a list of all of the books ordered by rank (high rank = more votes, so I'm getting the list in reverse_order)
    @item = @items.first
  end

  def show
    @item = Book.find(params[:id])
  end

  def new
    @item = Book.new
  end

  def create
    @item = Book.new(name: params[:book][:name], creator: params[:book][:creator], description: params[:book][:description])
    @item.save

    redirect_to show_book_url(@item.id)
  end

  def edit
    @item = Book.find(params[:id])
  end

  def update
    @item = Book.update(params[:id], {name: params[:book][:name], creator: params[:book][:creator], description: params[:book][:description]})
    redirect_to show_book_url(id: params[:id])
  end

  def destroy
    @item = Book.find(params[:id]) rescue ArgumentError.new("This id cannot by found")  #this allows for testing invalid intries in model_controller_test.rb
    @item.destroy

    redirect_to index_book_url
  end

  def upvote
    book = Book.find(params[:id])
    book.increment!(:rank) # auto saves
    redirect_to(:back)
  end

end
