class StoriesController < ApplicationController
  before_action :set_kid, only: %i[new create show]

  def new
    @story = Story.new
    @contextual_question = Question.where(contextual: true).sample
    @answer = Answer.new(question: @contextual_question)
  end

  def create
    @story = Story.new(theme: story_params[:theme],
                       lenght: story_params[:lenght].to_i - 1)
    @story.kid = @kid
    @contextual_question = Question.find(params.dig(:story, :answer, :question_id))
    @answer = Answer.create(content: params.dig(:story, :answer, :content), kid: @kid, question: @contextual_question)
    if @story.save
      GenerateStoryContentJob.perform_later(@story, @answer)
      redirect_to kid_story_path(@kid, @story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def set_kid
    @kid = Kid.find(params[:kid_id])
  end

  def story_params
    params.require(:story).permit(:theme, :lenght)
  end
end
