require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a book must have a title, description and author" do
    assert books(:mockingbird).valid?
    books(:mockingbird).title = nil
    assert_not books(:mockingbird).valid?
    books(:mockingbird).description = nil
    assert_not books(:mockingbird).valid?
    books(:mockingbird).written_by = nil
    assert_not books(:mockingbird).valid?
  end

  test 'a book must have a unique title' do
    mockingbird = books(:mockingbird)
    book = Book.new(:title => mockingbird.title)
    book.valid?
    assert_includes(book.errors[:title], "has already been taken")
  end
end
