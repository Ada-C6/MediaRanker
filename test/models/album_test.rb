require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Cannot create an album without a name" do
    album = Album.new
    assert_not album.valid?
    assert_includes album.errors, :name
  end

  test "Create an album with a name" do
    albums.each do |album|
      assert album.valid?
    end
  end

  test "Album.sort_by_rank returns a list of albums sorted by rank in descending order" do
    assert_equal Album.sort_by_rank.first, albums(:bad_company)
  end

  test "Album.sort_by_rank places items with nil :rank at the bottom" do
    assert_equal Album.sort_by_rank.last, albums(:nil_rank)
  end

  test "Album.sort_by_rank returns all items in database" do
    assert_equal Album.sort_by_rank.count, 4
  end
end
