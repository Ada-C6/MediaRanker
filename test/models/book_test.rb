require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Book cannot be created without a title or author" do
    book = Book.new(description: "Why is there no title or author")
    assert_not book.save
    assert_includes book.errors, :title && :written_by
  end
end
