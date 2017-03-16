require 'test_helper'

class LeslieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A Leslie must have a title" do
    airplane = Leslie.new
    assert_not airplane.valid? "A Leslie without a name is invalid."
    airplane.title = "Airplane"
    assert airplane.valid? "Weird"
  end

  test "two leslies can have same name but not same appears_in" do
    assert_equal leslies(:leslie1).title, leslies(:leslie2).title
    assert_not leslies(:leslie2).valid? "Two leslies cannot have the same title"
  end

end
