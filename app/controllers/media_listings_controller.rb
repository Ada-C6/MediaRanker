class MediaListingsController < ApplicationController
  def index
    @media_listings = MediaListing.where(type: params[:type])
  end

  # This will currently show any type of media as long as the id is correct (so the movie with id =1 will also show on /books/1)
  def show
    @media_listing = MediaListing.find(params[:id])
  end

  def new
    @media_listing = MediaListing.new
    @media_listing.type = params[:type] # in FarMar we only did this stuff in create-method
  end

  def destroy
    MediaListing.find(params[:id]).destroy
    raise
    # redirect_to #where do I want to redirect?
  end

  def create
    @media_listing = MediaListing.new(media_listing_params)
    # @media_listing.type = params[:type] # ???!!
    raise

    if @media_listing.save
      # SUCCESS
      # redirect_to # WHERE?
    else
      # DID NOT SAVED
      render :new
    end
  end

  def edit
    @media_listing = MediaListing.find(params[:id])
    raise
  end

  def update
    @media_listing = MediaListing.find(params[:id])
    raise # Error for some reason :media listing is empty here
    if @media_listing.update(media_listing_params)
      # SUCCESS
      # redirect_to # WHERE? method media_path (for movie_path if movie etc)
    else
      # NO UPDATE
      render :edit
    end
  end

  # #########
  private

  def media_listing_params
    params.require(:media_listing).permit(:type, :ranking)
  end

end
