class FamiliesController < ApplicationController

  def show
    @family = current_user.families.first
    @kids = @family.kids
  end
end
