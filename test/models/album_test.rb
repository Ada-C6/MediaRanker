require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "An album must have a name" do
    assert albums(:X).valid?
    albums(:X).name = nil
    assert_not albums(:X).valid?
  end

end
