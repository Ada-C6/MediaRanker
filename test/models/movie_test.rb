require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A moive must have a title" do
    little_women = Movie.new
    little_women.valid? "An book without a title is invalid."
    assert_not little_women.save
  end

  test "A movie must have a creator" do
    bob = Movie.new
    bob.title = "A Year in Paris"
    bob.description = "Year in this new place"
    bob.valid?
    assert_not bob.save
  end
  test "A movie must have a description" do
    bob = Movie.new
    bob.title = "A Year in Paris"
    bob.creator = "Jane Doe"
    bob.valid?
    assert_not bob.save
  end
end
