require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "Book name cannot be empty" do
    book = Book.new
    assert_not book.valid?
  end
end
