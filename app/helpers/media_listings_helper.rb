module MediaListingsHelper

  def created_per_type(listing)
    if listing.type == "Movie"
      return "Directed"
    elsif listing.type == "Book"
      return "Written"
    elsif listing.type == "Album"
      return "Performed"
    else
      return "(Unknown media type) Created"
    end
  end

  def creator_per_type(listing)
    if listing.type == "Movie"
      return "Director"
    elsif listing.type == "Book"
      return "Author"
    elsif listing.type == "Album"
      return "Artist"
    else
      return "(Unknown media type) Created"
    end
  end

  def add_media_text(listings)
    if listings.first.type == "Movie"
      return "Add a Movie"
    elsif listings.first.type == "Book"
      return "Add a Book"
    elsif listings.first.type == "Album"
      return "Add an Album"
    else
      return Error("Unknown media")
    end
  end

end
