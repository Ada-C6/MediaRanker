class LesliesController < ApplicationController
  def index
    @leslies = Leslie.all.sort_by {|leslie| leslie.leslie_votes.count }.reverse
  end

  def show
    @leslies = Leslie.all
    @leslie = Leslie.find(params[:id].to_i)
  end

  def new
    @leslie = Leslie.new
  end

  def create
    @leslie = Leslie.new
    @leslie.title = params[:leslie][:title]
    @leslie.part = params[:leslie][:part]
    @leslie.year = params[:leslie][:year]
    @leslie.save

    redirect_to show_leslie_path(@leslie.id)
  end

  def edit
      @leslie = Leslie.find(params[:id].to_i)
  end

  def update
    @leslie = Leslie.find(params[:id].to_i)
    @leslie.title = params[:leslie][:title]
    @leslie.part = params[:leslie][:part]
    @leslie.year = params[:leslie][:year]
    @leslie.save

    redirect_to show_leslie_path(@leslie.id)
  end

  def delete
    @leslie = Leslie.find(params[:id].to_i)
    @leslie.destroy

    redirect_to leslie_path
  end

  def upvote
    @leslie = Leslie.find(params[:id].to_i)
    @leslie.leslie_votes.create
    
    redirect_to show_leslie_path(@leslie.id)
  end

end

private
def params
  params.require(:leslie).permit(:title, :part, :year)
end
