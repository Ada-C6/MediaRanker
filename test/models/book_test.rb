require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Book must have a name" do
    book = books("without_a_name")
    book.name = nil

    assert_not book.valid?
  end

  test "Book must have some sort of rank point value" do
    book = books("without_rank_points")
    book.rank_points = nil

    assert_not book.valid?
  end

  test "Book must have an author" do
    book = books("without_an_author")
    book.author = nil

    assert_not book.valid?
  end

  test "Book can have negative points" do
    book = books("correct_book")
    book.rank_points -= 100
    
    assert_operator book.rank_points, :<, 0
    assert book.valid?
  end
end
