module ApplicationHelper

  def display_amount(media_collection)
    if media_collection.length > 10
      10
    else
      media_collection.length
    end
  end

  def create_media_path(media)
    if media.class == Movie
      movie_path(media)
    elsif media.class == Book
      book_path(media)
    elsif media.class == Album
      album_path(media)
    end
  end

  def create_edit_path(media)
    if media.class == Movie
      edit_movie_path(media)
    elsif media.class == Book
      edit_book_path(media)
    elsif media.class == Album
      edit_album_path(media)
    end
  end

  def create_upvote_path(media)
    if media.class == Movie
      upvote_movie_path(media)
    elsif media.class == Book
      upvote_book_path(media)
    elsif media.class == Album
      upvote_album_path(media)
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

  def get_creator_field(media)
    if media.class == Movie
      :director
    elsif media.class == Book
      :author
    elsif media.class == Album
      :artist
    end
  end

end
