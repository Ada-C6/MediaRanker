require 'test_helper'

class MediaListingTest < ActiveSupport::TestCase
  test "Created media listings must have a name and a type" do
    puts ">>> DPR: #{MediaListing.count}"
    puts ">>> DPR: #{MediaListing.first.inspect}"
    listing_movie = media_listings(:valid_movie)
    assert listing_movie.valid?

    listing_book = media_listings(:valid_book)
    assert listing_book.valid?

    listing_album = media_listings(:valid_album)
    assert listing_album.valid?

    incomplete_album = media_listings(:invalid_listing_type)
    assert_not incomplete_album.valid?

    blank_listing_name = media_listings(:blank_listing_name)
    assert_not blank_listing_name.valid?

    blank_listing_type = media_listings(:blank_listing_type)
    assert_not blank_listing_type.valid?
  end

# # The .yml is set up to have three of each type of media
# # Movies have rankings 10, 20, 30
# # Books have rankings 50, 40, 30
# # Albums have rankings 70, 20, 50
#   test "should sort listings in ranking order, top-down" do
#     ordered_movies = [:valid_movie, :valid_movie2, :valid_movie3]
#     assert_equal media_listings.order_by_ranking, ordered_movies
#   end
end
