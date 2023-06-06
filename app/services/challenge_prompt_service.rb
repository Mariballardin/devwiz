require "openai"

class ChallengePromptService
  attr_reader :client, :prompt

  def initialize(challenge_prompt)
    @client = OpenAI::Client.new
    @challenge_prompt = chalenge_prompt
  end

  def build_challenge_prompt
    "#{@challenge_prompt}"
  end

  def call
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: prompt }], # Required.
          temperature: 0.7,
          stream: false,
					max_tokens: 800 # might want to check this
      })
    # you might want to inspect the response and see what the api is giving you
    return response["choices"][0]["message"]["content"]
  end
end
