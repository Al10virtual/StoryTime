require "open-uri"

class GenerateStoryImageJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :default

  def perform(story)
    story.image_prompt = "Crée une illustration fantastique pour enfants sans texte sur le thème suivant: #{story.title}."
    image_size = "512x512"
    image_url = ChatGptService.generate_image(story.image_prompt, image_size)
    file = URI.open(image_url)
    story.image.attach(io: file, filename: "story_#{story.id}.png", content_type: "image/png")
    story.save
  end
end
