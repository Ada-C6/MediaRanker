class SeinfeldsController < ApplicationController
  def index
    @seinfelds = Seinfeld.all.order(rank: :desc)
  end

  def find_seinfeld
    if Seinfeld.exists?(params[:id].to_i) == true
      return Seinfeld.find(params[:id].to_i)
    else
      render :status => 404
    end
  end

  def show
    @myseinfeld = find_seinfeld
  end

  def upvote
    @myseinfeld = find_seinfeld
    @myseinfeld.rank += 1
    @myseinfeld.save
    redirect_to seinfeld_path
  end

  def downvote
    @myseinfeld = find_seinfeld
    @myseinfeld.rank -= 1
    @myseinfeld.save
    redirect_to seinfeld_path
  end

  def new
    @myseinfeld = Seinfeld.new
    @post_method = :post
    @post_path = seinfelds_path
  end

  def create
    @params = params
    @myseinfeld = Seinfeld.new
    @myseinfeld.title = params[:seinfeld][:title]
    @myseinfeld.season = params[:seinfeld][:season]
    @myseinfeld.episode = params[:seinfeld][:episode]
    @myseinfeld.description = params[:seinfeld][:description]
    @myseinfeld.rank = 0

    if @myseinfeld.save
      redirect_to seinfelds_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = seinfelds_path
      render :new
    end
  end

  def edit
    @myseinfeld = find_seinfeld
    @post_method = :put
    @post_path = seinfeld_path(@myseinfeld.id)
  end

  def update
    @params = params
    @myseinfeld = find_seinfeld
    @myseinfeld.title = params[:seinfeld][:title]
    @myseinfeld.season = params[:seinfeld][:season]
    @myseinfeld.episode = params[:seinfeld][:episode]
    @myseinfeld.description = params[:seinfeld][:description]

    if @myseinfeld.save
      redirect_to seinfeld_path(@myseinfeld.id)
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :put
      @post_path = seinfeld_path(@myseinfeld.id)
      render :edit
    end
  end

  def destroy
    @myseinfeld = find_seinfeld
    if @myseinfeld.class == Seinfeld
      @myseinfeld.destroy
      redirect_to seinfelds_path
    end
  end
end
