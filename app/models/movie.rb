class Movie < ActiveRecord::Base
  validates :name, presence: true

  def self.sort_by_rank
    order('rank DESC')
  end

  def upvote
    @movie = Movie.find(params[:id])
    if @movie.rank.nil?
      @movie.rank = 1
    else
      @movie.rank += 1
    end
    @movie.update(movie_params)
    redirect_to movie_path
  end

end
