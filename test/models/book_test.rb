require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "A book must have a title" do
    little_women = Book.new
    little_women.valid? "An book without a title is invalid."
    assert_not little_women.save
  end

  test "A book must have a creator" do
    bob = Book.new
    bob.title = "A Year in Paris"
    bob.description = "Year in this new place"
    bob.valid?
    assert_not bob.save
  end
  test "A book must have a description" do
    bob = Book.new
    bob.title = "A Year in Paris"
    bob.creator = "Jane Doe"
    bob.valid?
    assert_not bob.save
  end



end
