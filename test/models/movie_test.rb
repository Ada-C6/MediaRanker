require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movies with good date range are valid" do
    assert movies(:valid_data).valid?
  end

  test "movies with out a name are invalid" do
    assert_not movies(:missing_name).valid?
  end

  test "movies with discription with too many words" do
    assert_not movies(:too_many_des_words).valid?
  end
end
