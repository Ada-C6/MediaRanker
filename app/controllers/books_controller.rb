class BooksController < ApplicationController
  require 'sort_by_rank.rb'
  require 'vote.rb'
  include SortByRank
  include Vote

  def index
    @books = sort_by_rank(Book.all)
  end

  def create
    @book = Book.create!(book_params)

    redirect_to book_path(@book)
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]).destroy

    redirect_to books_path
  end

  def vote
    book = Book.find(params[:id])

    if params[:vote] == "up"
      add_vote(book).save
    elsif params[:vote] == "down"
      subtract_vote(book).save
    else
      raise
    end

    redirect_to books_path
  end


  ####### STRONG PARAMS #########

  private

  def book_params
    params.require(:book).permit(:name, :author, :description, :rank_points, :vote)
  end

end
