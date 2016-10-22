class HomepageController < ApplicationController

  def index
    @netflixes = Netflix.all.sort_by {|n| n.ranking}.reverse!
    @capstones = Capstone.all.sort_by {|c| c.ranking}.reverse!
    @books = Book.all.sort_by {|b| b.ranking}.reverse!
  end


end
