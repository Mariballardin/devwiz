require "openai"

class CodeReviewsController < ApplicationController
  attr_reader :client, :prompt

  before_action :set_prompt
  before_action :set_code_review, only: [:show]

  def initialize(code_review)
    @client = OpenAI::Client.new
    @code_review = code_review
  end

  def index
    @code_reviews = @prompt.code_reviews
  end

  def new
    @code_reviews = CodeReview.new
  end

  def create
    @code_review = CodeReview.new(code_review_params)
    @code_review.prompt = @prompt
    @code_review.user = current_user
    if @code_review.save
      received_feedback = generate_feedback(@prompt.received_challenge, @code_review.user_answer)
      @code_review.received_feedback = received_feedback
      @code_review.save
      redirect_to code_review_path(@code_review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_prompt
    @prompt = Prompt.find(params[:prompt_id])
  end

  def set_code_review
    @code_review = CodeReview.find(params[:id])
  end

  def build_feedback_prompt
    "Consider the #{prompt.user_answer} and create a feedback for the user saying exactly where they have made mistakes
    to solve the coding challenge."
  end

  def generate_feedback(challenge_prompt, user_answer)
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are a code reviewer." },
          { role: "user", content: build_feedback_prompt },
          { role: "user", content: user_answer }
        ],
        temperature: 0.7,
        stream: false,
        max_tokens: 800
      }
    )
    return response["choices"][0]["message"]["content"]
  end
end
# acho que é received_challenge aqui
