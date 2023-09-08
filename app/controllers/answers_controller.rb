class AnswersController < ApplicationController
  def new
    @kid = Kid.find(params[:kid_id])
    questions = Question.where(contextual: false) - @kid.questions
    @question = questions.sample
    @answer = Answer.new
  end

  def create
    @kid = Kid.find(params[:kid_id])
    @answer = Answer.new(answer_params)
    @answer.kid = @kid
    if @answer.save!
      redirect_to kid_path(@kid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    if @answer.destroy
      flash[:notice] = "Réponse bien supprimée !"
      redirect_to kid_path(@answer.kid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :kid_id)
  end
end
