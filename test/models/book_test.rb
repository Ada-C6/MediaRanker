require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "A Book should have a title" do
    assert_not books(:book2).valid? "A book without a title is invalid"
    books(:book2).title = "Title"
    assert books(:book2).valid? "For some reason the title is not valid"
  end

  test "A Book does not need an author or description" do
    assert books(:book3).valid? "A book without an author and description is valid"
  end
end
