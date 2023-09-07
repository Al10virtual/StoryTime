class GenerateStoryContentJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :default
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  def perform(story, answer)
    setup_story_properties(story, answer)
    generate_story_content(story)
    broadcast_story(story)
  end

  def setup_story_properties(story, answer)
    @kid = story.kid
    non_contextual_answer = fetch_non_contextual_answer
    additional_context = non_contextual_answer ? generate_additional_context(non_contextual_answer) : ""
    story.prompt = build_story_prompt(story, answer, additional_context)
  end

  def fetch_non_contextual_answer
    Answer.joins(:question).where(questions: { contextual: false }).sample
  end

  def generate_additional_context(non_contextual_answer)
    "À la question #{non_contextual_answer.question.title}, ils ont répondu #{non_contextual_answer.content}."
  end

  def build_story_prompt(story, answer, additional_context)
    age = calculate_age(@kid.date_of_birth)
    "Agis comme un auteur de livres pour enfants. Ecris une histoire de #{story.length} durée de type \"#{story.theme}\" pour #{@kid.first_name}.
     Adapte l'histoire à son âge (#{age} ans). Pour créer l'histoire tiens compte du contexte suivant : à la question \"#{answer.question.title}\", les parents de #{@kid.first_name} ont répondu #{answer.content}.
     #{additional_context}
     Réponds-moi par un JSON avec le titre de l'histoire contenu dans une clé \"title\" et son contenu dans une clé \"content\"."
  end

  def generate_story_content(story)
    chat_gpt_response = JSON.parse(ChatGptService.generate_story(story.prompt))
    story.content = chat_gpt_response["content"]
    story.title = chat_gpt_response["title"]
    story.save
    StoryChannel.broadcast_to(story, { step: "text" })
    GenerateStoryAudioJob.perform_now(story)
    GenerateStoryImageJob.perform_now(story)
  end

  def broadcast_story(story)
    broadcast(story)
  end

  private

  def calculate_age(date_of_birth)
    today = Date.today
    age = today.year - date_of_birth.year
    age -= 1 if today < date_of_birth + age.years
    age
  end
end
