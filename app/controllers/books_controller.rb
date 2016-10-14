class BooksController < ApplicationController
  def index
    @all_books=Book.order(rank: :desc)

  end

  def show
    @this_book=Book.find(params[:id])

  end

  def edit
    @this_book=Book.find(params[:id])
    @book_method= :put
    @book_path= book_url(@this_book)
    
  end

  def update
    @this_book=Book.find(params[:id])
    
    @this_book.name = params[:book][:name]
    @this_book.author = params[:book][:author]
    @this_book.description = params[:book][:description]

    @this_book.save

    redirect_to book_url(@this_book)
  end

  def new
    @this_book=Book.new
    @book_method= :post
    @book_path= books_url
  end

  def create
    @this_book=Book.new
    #set the values for attributes
    @this_book.name = params[:book][:name]
    @this_book.author = params[:book][:author]
    @this_book.description = params[:book][:description]
    @this_book.rank = 1
    
    @this_book.save
    
    redirect_to book_url(@this_book)
  end

  def destroy
    potential=Book.find_by_id(params[:id]) 
    
    unless potential==nil 
      @this_book=potential
      @this_book.destroy
      redirect_to books_url
    end
  end

  def upvote
    @this_book=Book.find(params[:id])
    @this_book.rank+=1
    
    @this_book.save
    redirect_to :back 
  end


  def downvote
    @this_book=Book.find(params[:id])
    @this_book.rank-=1
    
    @this_book.save
    redirect_to :back 
  end
end
