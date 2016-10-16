require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Create an book w/ valid data" do
    assert books(:pride_and_prejudice).valid?
  end

  test "Create an book with no name" do
    book = Book.new
    assert_not book.valid?
  end

  test "Create an book with the same name as another" do
    book1 = Book.create!(name: "foo", author: "hi")
    book2 = Book.new(name: "foo")
    assert book2.valid?
  end

  test "Create an book with the same name and author as another" do
    book1 = Book.create!(name: "foo", author: "bar")
    book2 = Book.new(name: "foo", author: "bar")
    assert_not book2.valid?
  end
end
