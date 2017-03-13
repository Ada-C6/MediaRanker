require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "An Book must be valid" do
    assert books(:one).valid?,  "an Book must have a name"
    assert books(:three).valid?,  "an Book must have a name"

    books(:one).name = nil   # This only happens in this test
    assert_not books(:one).valid?  # this is based on validations in : app/models/book.rb
  end

  test "An Book must have a name" do
    item = Book.new

    assert_not item.valid?, "An Item without a name is invalid."
    item.name = "Gardens"
    assert item.valid?, "More than just a name must be required..."
  end

  test "Book 1 has the correct title " do
    assert_equal books(:one).name,  "book1",  "The Book must have the correct"
  end
end
