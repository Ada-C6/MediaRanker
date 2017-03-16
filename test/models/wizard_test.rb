require 'test_helper'

class WizardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A Widard must have a title" do
    harry = Wizard.new
    assert_not harry.valid? "A Wizard without a name is invalid."
    harry.title = "Harry Potter"
    assert harry.valid? "Harry Potter apparently is not valid."
  end

  test "Two magical stories cannot be the same" do
    assert_equal wizards(:one).title, wizards(:three).title
    refute_equal wizards(:one), wizards(:three)
    assert_not wizards(:three).valid? "Two wizards cannot have the same title"
  end
end
