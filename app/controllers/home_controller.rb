class HomeController < ApplicationController
  def index
    @bobs = Bob.all.sort_by {|bob| bob.bob_votes.count }.reverse.first(5)
    @leslies = Leslie.all.sort_by {|leslie| leslie.leslie_votes.count }.reverse.first(5)
    @wizards = Wizard.all.sort_by {|wizard| wizard.wizard_votes.count }.reverse.first(5)
  end
end
