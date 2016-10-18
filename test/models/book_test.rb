require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "validations: books without titles are not valid" do
    book = books(:matilda)
    assert_not book.valid?
  end

  test "validations: books with titles are valid" do
    book = books(:wizard_of_oz)
    assert book.valid?
  end

  test "validations: books with no author are not valid" do
    book = books(:anne_green_gables)
    assert_not book.valid?
  end

  test "validations: books with an author are valid" do
    book = books(:coraline)
    assert book.valid?
  end
end
