require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "validations: book name can't be blank" do
    book = books(:HP_two)
    assert_not book.valid?
    assert book.errors.keys.include?(:name), "name is not in the errors hash"
  end

  test "validations: book author can't be blank" do
    book = books(:HP_one)
    assert_not book.valid?
    assert book.errors.keys.include?(:author), "author is not in the errors hash"
  end

  test "Create an book w/ valid data" do
    book = books(:HP_five)
    assert book.valid?
  end

  test "Create two books with different titles" do
    book1 = books(:HP_three)
    book2 = books(:HP_four)
    assert book2.valid?
  end

end
