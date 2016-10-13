require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A Album must have a title" do
    little_women = Album.new
    little_women.valid? "An Album without a title is invalid."
    assert_not little_women.save
  end

  test "A album must have a creator" do
    bob = Album.new
    bob.title = "A Year in Paris"
    bob.description = "Year in this new place"
    bob.valid?
    assert_not bob.save
  end
  test "A album must have a description" do
    bob = Album.new
    bob.title = "A Year in Paris"
    bob.creator = "Jane Doe"
    bob.valid?
    assert_not bob.save
  end
end
