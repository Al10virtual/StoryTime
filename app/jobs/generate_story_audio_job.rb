class GenerateStoryAudioJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :default

  def perform(story)
    base64mp3 = GoogleSpeechClient.new.get_sound(story.content)
    file_name = I18n.transliterate(story.title).gsub(/[^0-9A-Za-z]/, '_').downcase
    save_path = Rails.root.join('public/speech', "#{file_name}.mp3")
    File.open(save_path, "wb") do |file|
      file.write(Base64.decode64(base64mp3))
    end
    story.audio.purge if story.audio.attached?
    story.audio.attach(io: File.open(save_path), filename: file_name, content_type: 'audio/mp3')
  end
end
