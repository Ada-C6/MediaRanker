require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "albums with good date range are valid" do
    assert albums(:valid_data).valid?
  end

  test "albums with out a name are invalid" do
    assert_not albums(:missing_name).valid?
  end

  test "albums with discription with too many words" do
    assert_not albums(:too_many_des_words).valid?
  end
end
