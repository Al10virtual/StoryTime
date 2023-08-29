class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.content = generate_story_content(@story)
    if @story.save
      redirect_to kid_story_path(@story.kid, @story)
    else
      render :new
    end
  end

  private

  def story_params
    params.require(:story).permit(:story_type, :environment, :duration)
  end

  def generate_story_content(story)
    # Use the OpenAI gem to generate the story content based on the user's preferences
    response = Openai::Completion.create(
      model: "gpt-3.5-turbo",
      prompt: "Create a #{story.duration} #{story.theme} story set in a #{story.environment}.",
      max_tokens: 500 # Adjust as needed
    )
    response.choices.first.text.strip
  end

end
