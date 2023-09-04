class GenerateStoryContentJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :default

  def perform(story, answer)
    @kid = story.kid
    story.prompt = "Agis comme un auteur pour enfants à succès. Ecris une histoire de #{story.lenght} durée de type #{story.theme} pour #{@kid.first_name}. Adapte l'histoire à son age (#{calculate_age(@kid.date_of_birth)} ans). De plus, ajoute dans l'histoire le context suivant: à la question suivante, #{answer.question.title}, les parents de #{@kid.first_name} ont répondu #{answer.content}. Donne-moi un JSON avec en clé title, le titre de cette histoire et une clé content avec le contenu de l’histoire."
    chat_gpt_response = JSON.parse(ChatGptService.generate_story(story.prompt))
    story.content = chat_gpt_response["content"]
    story.title = chat_gpt_response["title"]
    story.save
    GenerateStoryAudioJob.perform_now(story)
    GenerateStoryImageJob.perform_now(story)
    broadcast(story)
  end

  private

  def calculate_age(date_of_birth)
    today = Date.today
    age = today.year - date_of_birth.year
    age -= 1 if today < date_of_birth + age.years
    age
  end

  def broadcast(story)
    StoryChannel.broadcast_to(story, {
      html: ApplicationController.renderer.render_to_string(partial: 'stories/loaded_story', locals: { story: story, kid: story.kid }, formats: :html)
    })
  end
end
