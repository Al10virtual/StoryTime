class KidsController < ApplicationController

  def show
    @kid = Kid.find(params[:id])
  end

  def new
    @kid = Kid.new
  end

  def create
    @family = Family.find(params[:family_id])
    @kid = Kid.new(kid_params)
    @kid.family = @family
    if @kid.save!
      redirect_to kid_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :date_of_birth, :photo)
  end
end
