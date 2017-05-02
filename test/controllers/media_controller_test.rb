require 'test_helper'

class MediaControllerTest < ActionController::TestCase

  setup do
    @media = media(:movie_all_fields)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(@books)
    assert_not_nil assigns(@movies)
    assert_not_nil assigns(@songs)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_equal @media.name, "My Fair Lady"
    assert_equal @media.auteur, "Rene Russo"
  end

  test "should create item" do
    assert_difference('Medium.count') do
      @new_item = Medium.create(category: "Book", name: "My Fair Lady", auteur: "Rene Russo", score: 1)
    end
  end

  test "should show item" do
    get :show, id: @media
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @media
    assert_response :success
  end

  test "should destroy post" do
   assert_difference('Medium.count', -1) do
     delete :destroy, id: @media
   end
 end

end
