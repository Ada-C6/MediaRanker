class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = findBook
  end

  def edit
    @book = findBook

    if @book== nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @book = findBook

    if @book.update(title: params[:book][:title], written_by: params[:book][:written_by], description: params[:book][:description])
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
    @book.title = params[:book][:title]
    @book.written_by = params[:book][:written_by]
    @book.description = params[:book][:description]

    if(@book.save)
      #saved successfully; go to index
      redirect_to :action => "index"
    else
      #validation failed; show the "new" form again
      render :action => :new
    end
  end

  def destroy
    @book = findBook
    @book.destroy

    redirect_to action: "index"
  end

  def upvote
    Book.increment_counter(:ranked, params[:id])
    redirect_to action: "show"
  end

  private
  def findBook
    return Book.find(params[:id].to_i)
  end


end
