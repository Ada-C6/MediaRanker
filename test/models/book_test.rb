require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "books with good date range are valid" do
    assert books(:valid_data).valid?
  end

  test "books with out a name are invalid" do

    assert_not books(:missing_name).name, nil
  end

  test "books with discription with too many words" do
    assert_not books(:too_many_des_words).valid?
  end
end
