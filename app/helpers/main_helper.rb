module MainHelper

  # Method should return an array of objects in the order of ranking
  # Should move to application helper and use elsewhere
  def order_by_ranking(listings)
    listings.order(:ranking).reverse
  end

end
