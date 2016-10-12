class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @movies = Movie.by_rank
    @books = Book.all.order(:ranked).reverse
    @albums = Album.all.order(:ranked).reverse
  end
end
