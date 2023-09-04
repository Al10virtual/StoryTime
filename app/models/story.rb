class Story < ApplicationRecord
  THEMES = ["Aventure", "Conte de fée", "Fantaisie", "Historique", "Mystère", "Educatif"]
  belongs_to :kid
  has_one_attached :audio
  enum :lenght, {
    courte: 0,
    moyenne: 1,
    longue: 2
  }
  after_create :audio_upload
  #after_update :audio_upload

  private

  def audio_upload
    #try_text = "Il était une fois, dans un petit village au cœur d’une forêt enchantée, vivait un jeune garçon nommé Élodie."
    base64mp3 = GoogleSpeechClient.new.get_sound(content)
    file_name = I18n.transliterate(title).gsub(/[^0-9A-Za-z]/, '_').downcase
    save_path = Rails.root.join('public/speech', "#{file_name}.mp3")
    mp3_file = File.open(save_path, "wb") do |file|
      file.write(Base64.decode64(base64mp3))
    end
    audio.purge if audio.attached?
    audio.attach(io: File.open(save_path), filename: file_name, content_type: 'audio/mp3')
  end
end
