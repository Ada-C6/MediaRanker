def update_route(listing)
  if listing.type == "Movie"
    return movie_path(listing.id)
  elsif listing.type == "Book"
    return book_path(listing.id)
  elsif listing.type == "Album"
    return album_path(listing.id)
  else
    return "Unknown media"
  end
end

def edit_route(listing)
  if listing.type == "Movie"
    return edit_movie_path(listing.id)
  elsif listing.type == "Book"
    return edit_book_path(listing.id)
  elsif listing.type == "Album"
    return edit_album_path(listing.id)
  else
    return "Unknown media"
  end
end

def new_route
  if @media_listings.first.type == "Movie"
    return new_movie_path
  elsif @media_listings.first.type == "Book"
    return new_book_path
  elsif @media_listings.first.type == "Album"
    return new_album_path
  else
    return "Unknown media"
  end
end

def media_listing_route(listing)
  if listing.type == "Movie"
    return movie_path(listing.id)
  elsif listing.type == "Book"
    return book_path(listing.id)
  elsif listing.type == "Album"
    return album_path(listing.id)
  else
    return "Unknown media"
  end
end

def media_listings_route(listings)
  if listings.first.type == "Movie"
    return movies_path
  elsif listings.first.type == "Book"
    return books_path
  elsif listings.first.type == "Album"
    return albums_path
  else
    return "Unknown media"
  end
end

# Used by MediaListingsController create method
# Used by _buttons - rename
def create_media_route
  if params[:type] == "Movie"
    return movies_path
    # return create_movie_path
  elsif params[:type] == "Book"
    return books_path
    # return create_book_path
  elsif params[:type] == "Album"
    return albums_path
    # return create_album_path
  else
    return "Unknown media"
  end
end
