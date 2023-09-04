class AnswersController < ApplicationController
  def new
    @question = Question.first
    @answer = Answer.new
    @kid = Kid.find(params[:kid_id])
  end

  def create
    @kid = Kid.find(params[:kid_id])
    @question = Question.first
    @answer = Answer.new(answer_params)
    @answer.kid = @kid
    @answer.question = @question
    if @answer.save!
      redirect_to kid_path(@kid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @kid = Kid.find(params[:kid_id])
    @answer = Answer.find(params[:id])
    if @answer.destroy
      flash[:success] = "Réponse bien supprimée !"
      # redirect_to kid_path(@kid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :kid_id)
  end
end
