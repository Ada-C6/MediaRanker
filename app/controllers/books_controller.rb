class BooksController < ApplicationController

  def findBook
    return Book.find(params[:id].to_i)
  end

  def upvote
    @book = findBook
    @book.ranking += 1
    @book.save
    redirect_to :action => "show"
  end

  def index
    @books = Book.all.sort_by {|b| b.ranking}.reverse!
  end

  def show
    @book = findBook
  end

  def edit
    @book = findBook

    if @book == nil
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def update
    edit

    if @book.update(name: params[:book][:name], description: params[:book][:description], genre: params[:book][:genre])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def new
    @book = Book.new
  end

  def create
    @params = params
    @book = Book.new
    @book.name = params[:book][:name]
    @book.description = params[:book][:description]
    @book.genre = params[:book][:genre]
    @book.ranking = 1

    if (@book.save)
     #if item is successfully saved, go to the index
     redirect_to :action => "index"
    else
     #if a validation is failed show the "new" form again
     render :action => :new
    end
  end

  def destroy
    @book = findBook
    @book.destroy

    redirect_to action: "index"
  end
end
