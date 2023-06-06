require "openai"

class ChallengePromptService
  attr_reader :client, :prompt

  def initialize(challenge_prompt)
    @client = OpenAI::Client.new
    @challenge_prompt = challenge_prompt
  end

  def build_challenge_prompt
    "Consider a coding challenge for a programmer who wants to prepare for an interview for the job position of #{@challenge_prompt.job_title}
    with #{@challenge_prompt.programming_language} as the programming language. The challenge should be at difficulty level #{@challenge_prompt.level},
    ranging from 1 (beginner) to 5 (advanced). The company operates in the #{@challenge_prompt.job_field} field and values #{@challenge_prompt.key_values}
    as its key principles."
    #{@challenge_prompt}
  end

  def call
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: build_challenge_prompt }], # Required.
          temperature: 0.7,
          stream: false,
					max_tokens: 800 # might want to check this
      })
    # you might want to inspect the response and see what the api is giving you
    return response["choices"][0]["message"]["content"]
  end
end
