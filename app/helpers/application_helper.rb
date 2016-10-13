module ApplicationHelper

  def create_show_path(media)

    if media.class == Movie
       movie_path(media)
    elsif media.class == Book
      book_path(media)
    elsif media.class == Album
      album_path(media)
    end
  end

  def get_creator(media)
    if media.class == Movie
      media.director
    elsif media.class == Book
      media.author
    elsif media.class == Album
      media.artist
    end
  end

end
