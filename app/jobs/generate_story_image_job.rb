require "open-uri"

class GenerateStoryImageJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :default

  def perform(story)
    story.image_prompt = "Crée l'illustration d'un conte pour enfant dont le titre est : \"#{story.title}\"."
    image_size = "512x512"
    image_url = ChatGptService.generate_image(story.image_prompt, image_size)
    file = URI.open(image_url)
    story.image.attach(io: file, filename: "story_#{story.id}.png", content_type: "image/png")
    story.save
    broadcast(story)
  end

  def broadcast(story)
    StoryChannel.broadcast_to(story, {
      step: "image",
      html: ApplicationController.renderer.render_to_string(partial: 'stories/loaded_story', locals: { story: story, kid: story.kid }, formats: :html)
    })
  end
end
