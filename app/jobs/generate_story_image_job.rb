class GenerateStoryImageJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :default

  def perform(story)
    story.image_prompt = "Crée une illustration fantastique pour enfants sans texte sur le thème suivant: #{story.title}."
    image_size = "512x512"
    response = ChatGptService.generate_image(story.image_prompt, image_size)
    story.image = response
    story.save
  end
end
