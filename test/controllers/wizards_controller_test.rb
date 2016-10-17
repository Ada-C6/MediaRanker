require 'test_helper'

class WizardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: wizards(:two).id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, {wizard: {title: "Naked Gun"} }
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, {id: wizards(:two).id }
    assert_response :success
  end

  test "should get update" do
    two = wizards(:two)
    patch :update, {id: two.id, wizard: {title: two.title}  }
    assert_response :redirect
  end

  test "should get delete" do
    delete :delete, {id: wizards(:two).id }
    assert_response :redirect
  end

  test "Deleting a Wizard changes the number of wizards" do
    assert_difference("Wizard.count", -1) do
      delete :delete, {id: wizards(:two).id }
    end
  end

  test "Voting for a Wizard changes vote count" do
    assert_difference("WizardVote.count", 1) do
      post :upvote, {id: wizards(:two).id }
    end
  end

end
