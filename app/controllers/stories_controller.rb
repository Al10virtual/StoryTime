class StoriesController < ApplicationController
  before_action :set_kid, only: [:new, :create, :show]

  def new
    @story = Story.new
  end

  def create
    @story = @kid.stories.build(story_params)
    @story.content = generate_story_content(@story)

    if @story.save
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
    params.require(:story).permit(:story_type, :environment, :duration)
  end

  def generate_story_content(story)
    prompt = "Crée une histoire #{story.duration} sur le thème #{story.theme}."
    ChatGptService.generate_story(prompt)
  end
end
