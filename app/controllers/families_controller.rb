class FamiliesController < ApplicationController

  def show
    @kid = Kid.new
    @family = current_user.families.first
    @kids = @family.kids
  end
end
