class SongsController < ApplicationController
  def index
    @songs = Song.all.order(rank: :desc)
  end

  def find_song
    return Song.find(params[:id].to_i)
  end

  def show
    @mysong = find_song
  end

  def upvote
    @mysong = find_song
    @mysong.rank += 1
    @mysong.save
    render :show
  end

  def downvote
    @mysong = find_song
    @mysong.rank -= 1
    @mysong.save
    render :show
  end

  def new
    @mysong = Song.new
    @post_method = :post
    @post_path = songs_path
  end

  def create
    @params = params
    @mysong = Song.new
    @mysong.title = params[:song][:title]
    @mysong.artist = params[:song][:artist]
    @mysong.album = params[:song][:album]
    @mysong.genre = params[:song][:genre]
    @mysong.rank = 0

    if @mysong.save
      redirect_to songs_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = songs_path
      render :new_song
    end
  end

  def edit
    @mysong = find_song
    @post_method = :put
    @post_path = song_path(@mysong.id)
  end

  def update
    @params = params
    @mysong = find_song
    @mysong.title = params[:song][:title]
    @mysong.artist = params[:song][:artist]
    @mysong.album = params[:song][:album]
    @mysong.genre = params[:song][:genre]

    if @mysong.save
      redirect_to song_path(@mysong.id)
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :put
      @post_path = song_path(@mysong.id)
      render :edit_song
    end
  end

  def destroy
    @mysong = find_song
    if @mysong != nil
      @mysong.destroy
      redirect_to songs_path
    end
  end
end
