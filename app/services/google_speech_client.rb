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
        # "name": "fr-FR-Neural2-D"
        "name": ["fr-FR-Wavenet-A", "fr-FR-Wavenet-B", "fr-FR-Wavenet-C", "fr-FR-Wavenet-D", "fr-FR-Wavenet-E"].sample
        # "name": ["fr-FR-Standard-B", "fr-FR-Polyglot-1", "fr-FR-Neural2-C"].sample
      },
      audioConfig: {
        "audioEncoding": "MP3",
        "pitch": 0,
        "speakingRate": 1
      }
    })
    self.class.post("/text:synthesize", { body: data }.merge(@options))["audioContent"]
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
end
