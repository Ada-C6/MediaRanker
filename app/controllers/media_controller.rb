class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  # GET /media
  # GET /media.json
  def index
    @books = Medium.where(category: "Book").order(score: :desc).limit(10)
    @movies = Medium.where(category: "Movie").order(score: :desc).limit(10)
    @songs = Medium.where(category: "Song").order(score: :desc).limit(10)
  end

  # Individual index pages by topic
  def books
    @books = Medium.where(category: "Book")
  end

  def movies
    @movies = Medium.where(category: "Movie")
  end

  def songs
    @songs = Medium.where(category: "Song")
  end


  # GET /media/1
  # GET /media/1.json
  def show
    set_medium
  end


  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new
    redirect_to show
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    set_medium
    @medium.name = params[:medium][:name]
    @medium.description = params[:medium][:description]
    @medium.auteur = params[:medium][:auteur]
    @medium.save
    redirect_to show
  end

  def upvote
    set_medium
    @medium.score += 1
    @medium.save
    redirect_to show
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    category = Medium.find(params[:id]).category

    @medium.destroy

    case category
    when "Movie"
      redirect_to movies_path
    when "Book"
      redirect_to books_path
    when "Song"
      redirect_to songs_path
    else
      redirect_to root_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_medium
    @medium = Medium.find(params[:id])
  end

end
