require 'test_helper'

class NetflixTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A netflix must have a name, genre, and description" do
    netflixes(:movieone).valid?
    netflixes(:movieone).name = nil
    assert_not netflixes(:movieone).valid?
    netflixes(:movieone).genre = nil
    assert_not netflixes(:movieone).valid?
    netflixes(:movieone).description = nil
    assert_not netflixes(:movieone).valid?
  end
end
