require "openai"

class CodeReviewService
  attr_reader :client, :prompt

  def initialize(prompt, code_review)
    @client = OpenAI::Client.new
    @prompt = prompt
    @code_review = code_review
  end

  def build_feedback_prompt
    "Consider this challenge: #{@prompt.received_challenge} and the user answer: #{@code_review.user_answer} create a feedback
    for the user saying exactly where they have made mistakes
    solving the coding challenge. You should add some advices about what they should study to improve their performance."
  end

  def call
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are a code reviewer." },
          { role: "user", content: build_feedback_prompt }
        ],
        temperature: 0.7,
        stream: false,
        max_tokens: 5000
      }
    )
    return response["choices"][0]["message"]["content"]
  end
end
