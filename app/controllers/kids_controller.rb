class KidsController < ApplicationController
  def show
    @kid = Kid.find(params[:id])
    @stories = @kid.stories
  end

  def new
    @kid = Kid.new
    @family = current_user.families.first
  end

  def create
    @family = Family.find(params[:family_id])
    @kid = Kid.new(kid_params)
    @kid.family = @family
    if @kid.save!
      redirect_to family_path(@family)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kid = Kid.find(params[:id])
    @family = @kid.family

    if @kid.destroy
      flash[:notice] = "Le compte de votre enfant a bien été supprimé !"
      redirect_to family_path(@family)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :date_of_birth, :photo)
  end
end
