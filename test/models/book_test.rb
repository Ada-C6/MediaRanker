require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Book cannot be created without a title or author" do
    book = Book.new(description: "Why is there no title or author")
    assert_not book.save
    assert_includes book.errors, :title && :by
  end

  test "Initial ranked should be 0" do
    book = Book.new(title: "Iliad", by: "Homer")
    assert_equal book.ranked, 0
  end


end
