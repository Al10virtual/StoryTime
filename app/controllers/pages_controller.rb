class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @family = current_user.families.first if user_signed_in?
  end
end
