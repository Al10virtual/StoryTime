class ChatGptService
  def self.generate_story(prompt)
    response = OpenAI::Client.new(access_token: ENV['GPT_KEY']).chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "user",
            content: prompt
          }
        ],
        temperature: 0.7
     }).symbolize_keys
    json_response = response.dig(:choices).first.dig("message", "content").gsub("\n", ' ')
  end

  def self.generate_image(image_prompt, image_size)
    response = OpenAI::Client.new(access_token: ENV.fetch('GPT_KEY')).images.generate(
      parameters: { prompt: image_prompt, size: image_size }
    )
    response.dig("data", 0, "url")
  end
end
