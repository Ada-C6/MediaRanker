module ApplicationHelper
  def media_listing_route(listing)
    if listing.type == "Movie"
      return movie_path(listing.id)
    elsif listing.type == "Book"
      return book_path(listing.id)
    elsif listing.type == "Album"
      return album_path(listing.id)
    else
      return Error("Unknown media")
    end
  end
end
