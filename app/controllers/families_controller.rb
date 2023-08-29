class FamiliesController < ApplicationController

  def show
    @family = current_user.families.first
  end
end
