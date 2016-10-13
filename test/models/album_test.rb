require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Album must have a name" do
    assert_not albums("without_a_name").valid?
  end
end
