require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "An book must have a rank greater than or equal to zero" do
    books(:one).rank = nil
    assert_not books(:one).valid?
  end

  test "An book must have a title" do
    assert_equal books(:one).title, "Book1"
    books(:one).title = nil
    assert_not books(:one).valid?
  end

  test "An book must have an author" do
    assert_equal books(:two).author, "Author2"
    books(:one).author = nil
    assert_not books(:one).valid?
  end

  test "An book can have a description but doesn't have to" do
    assert_equal books(:two).description, "A great second book!"
    books(:two).description = nil
    assert books(:one).valid?
  end
end
