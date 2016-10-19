require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  test "that upvote increments the votes attribute" do
    vote = media(:nine_stories).votes
    media(:nine_stories).upvote
    assert_equal vote + 1, media(:nine_stories).votes
  end

  test "Can create an instance of Media" do
    media = Medium.new
    media.name = "natasha"
    media.media_type = "movies"
    assert media.valid?
  end

  test "Cannot create an empty Media" do
    media = Medium.new
    assert_not media.valid?
  end

  test "Create a Media when inputs are valid" do
    media = Medium.new(name: "foo")
    assert media.valid?
  end
  test "Cannot create Medium with no name" do
    media = Medium.new
    assert_not media.valid?
  end
  test "Create two Media with different titles" do
    media1 = Medium.create!(name: "foo")
    media2 = Medium.new(name: "bar")
    assert media2.valid?
  end
  test "Cannot create two Medias with the same title" do
    media1 = Medium.create!(name: "foo")
    media2 = Medium.new(name: "foo")
    assert_not media2.valid?
  end
end
