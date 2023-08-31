require 'base64'
class GoogleSpeechClient
  include HTTParty
  base_uri 'https://texttospeech.googleapis.com/v1'

  def initialize
    @params = to_params
    @token = get_token
    @options = {
      headers: {
        "Authorization": "Bearer #{@token}",
        "Content-Type": "application/json; charset=utf-8"
      }
    }
  end

  def get_sound(word)
    data = JSON.dump({
      input: {
        "text": word
      },
      voice: {
        "languageCode": "fr-FR",
        "name": "fr-FR-Neural2-D"
      },
      audioConfig: {
        "audioEncoding": "MP3",
        "pitch": 0,
        "speakingRate": 1
      }
    })
    wordSub = "Speech"
    base64mp3 = self.class.post("/text:synthesize", { body: data }.merge(@options))["audioContent"]
    file_name = I18n.transliterate(wordSub).gsub(/[^0-9A-Za-z]/, '_').downcase
    save_path = Rails.root.join('public/speech', "#{file_name}.mp3")
    mp3_file = File.open(save_path, "wb") do |file|
      file.write(Base64.decode64(base64mp3))
    end
    # load_to_cloudinary(save_path, file_name)
  end

  private

  def to_params
    { 'refresh_token' => ENV['GOOGLE_CLIENT_REFRESH_TOKEN'],
      'client_id'     => ENV['GOOGLE_CLIENT_ID'],
      'client_secret' => ENV['GOOGLE_CLIENT_SECRET'],
      'grant_type'    => 'refresh_token'}
  end

  def request_token_from_google
    url = URI("https://accounts.google.com/o/oauth2/token")
    Net::HTTP.post_form(url, self.to_params)
  end

  def get_token
    JSON.parse(request_token_from_google.body)["access_token"]
  end

  # def load_to_cloudinary(save_path, file_name)
  #   callback = Cloudinary::Uploader.upload(save_path, {
  #     resource_type: :video,
  #     public_id: "audio_fr/#{file_name}"
  #   })
  #   { sound_url: callback["secure_url"] } if callback
  # end
end
