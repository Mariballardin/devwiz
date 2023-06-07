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
    ranging from 1 (beginner) to 5 (advanced), and have no more then 1000 caracteres. The challenge should require only one file to be coded.
    The company operates in the #{@challenge_prompt.job_field} field and values #{@challenge_prompt.key_values}
    as its key principles. Please, divide the challenge in bullets separated by 4 dashes and topics: First the Challenge, write Challenge and write 2 bullets points: one with the challenge
    and another one saying the difficulty level. After, Requirements, with 6 topics numered and each topic with the respectives bullet points. Lastly, write a 'Bonus features'
    from 1 to 3 with respectives bullet points."
    #{@challenge_prompt}
  end

  def call
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: build_challenge_prompt }], # Required.
          temperature: 0.7,
          stream: false,
					max_tokens: 250 # might want to check this
      })
    # you might want to inspect the response and see what the api is giving you
    return response["choices"][0]["message"]["content"]
    # challenges = parts[1].split("\n")
    # bonus = parts[2].split("\n")
    # {challenges: challenges, bonus: bonus}
  end
end
