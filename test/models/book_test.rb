require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create a book with no name" do
    book = Book.new
    assert_not book.valid?
  end
  
end
