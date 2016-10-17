class MediaListingsController < ApplicationController
  def index
    @media_listings = MediaListing.where(type: params[:type])
  end

  # This will currently show any type of media as long as the id is correct (so the movie with id =1 will also show on /books/1)
  def show
    @listing = MediaListing.find(params[:id])
  end

  def new
    @media_listing = MediaListing.new
  end

  # The actual destroy works
  def destroy
    index # is this allowed?
    MediaListing.find(params[:id]).destroy
    redirect_to media_listings_route(@media_listings)
  end

  def create
    creation_parameters = media_listing_params
    @media_listing = MediaListing.new(creation_parameters)
    @media_listing.ranking = 0
    @media_listing.type = params[:type]
    if @media_listing.save
      # SUCCESS
      redirect_to create_media_route
    else
      # DID NOT SAVE
      # Not sure these work as intended
      render :new
    end
  end

  def edit
    @media_listing = MediaListing.find(params[:id])
  end

  def update
    @media_listing = MediaListing.find(params[:id])
    @media_listing.ranking == nil ? params[:ranking] : @media_listing.ranking
    if @media_listing.update(media_listing_params)
      # SUCCESS
      redirect_to media_listing_route(@media_listing)
    else
      # NO UPDATE
      # Not sure these work as intended
      render :edit
    end
  end

  # #########
  private

  def media_listing_params
    if params[:movie] != nil
      return params.require(:movie).permit(:type, :ranking, :name, :creator, :description)
    elsif params[:book] != nil
      return params.require(:book).permit(:type, :ranking, :name, :creator, :description)
    elsif params[:album] != nil
      return params.require(:album).permit(:type, :ranking, :name, :creator, :description)
    elsif params[:media_listing] != nil
      return params.require(:media_listing).permit(:type, :ranking, :name, :creator, :description)
    else
      return params.permit(:ranking)
    end
  end
end
