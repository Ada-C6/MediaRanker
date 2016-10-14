class MediaController < ApplicationController
  def index
    @movies = Movie.order('votes DESC').first(10)
    @books = Book.order('votes DESC').first(10)
    @albums = Album.order('votes DESC').first(10)
  end

  def all
    medium_type = params[:type]
    model_class = type_to_model(medium_type)
    @media = model_class.order('votes DESC')
    @medium_type_name = medium_type.capitalize
  end

  def show
    @medium_id = params[:id].to_i
    @medium = Medium.find_by_id(@medium_id)

    if @medium == nil
      return render :file => "#{Rails.root}/public/404.html", :status => 404
    end

    type = @medium.type.downcase
    return render("show_#{type}")
  end

  def edit
    @medium = Medium.find(params[:id].to_i)
    type = @medium.type.downcase
    return render("edit_#{type}")
  end

  def update
    @medium = Medium.find(params[:id].to_i)

    medium_hash = params[@medium.type.downcase.to_sym]
    @medium.name = medium_hash[:name]
    @medium.description = medium_hash[:description]

    case @medium.type.downcase
    when 'book'
      @medium.author = medium_hash[:author]
    when 'movie'
      @medium.director = medium_hash[:director]
    when 'album'
      @medium.singer = medium_hash[:singer]
      @medium.artist = medium_hash[:artist]
    end

    if @medium.save
      return redirect_to action: 'show'
    else
      return render :status => 400
    end
  end

  def delete
    Medium.delete(params[:id].to_i)
    redirect_to action: 'index'
  end

  def upvote
    @medium = Medium.find(params[:id].to_i)
    Medium.increment_counter(:votes, params[:id].to_i)

    redirect_to action: 'show'
  end


  def type_to_model(type_name)
    case type_name.downcase
    when 'book'
      return Book
    when 'movie'
      return Movie
    when 'album'
      return Album
    else
      raise "unknown type #{type_name}"
    end
  end
end
