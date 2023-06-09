require "openai"

class CodeReviewsController < ApplicationController
  attr_reader :client, :prompt

  before_action :set_prompt, except: [:show]
  before_action :set_code_review, only: [:show]

  def index
    @code_reviews = @prompt.code_reviews
  
  end

  def new
    @code_review = CodeReview.new
  end

  def create
    @code_review = CodeReview.new(code_review_params)
    @code_review.prompt = @prompt
    received_feedback = CodeReviewService.new(@prompt, @code_review).call
    @code_review.received_feedback = received_feedback
    if @code_review.save
      redirect_to code_review_path(@code_review)
    else
      render "prompts/show", status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_prompt
    @prompt = Prompt.find(params[:prompt_id])
  end

  def code_review_params
    params.require(:code_review).permit(:user_answer)
  end

  def set_code_review
    @code_review = CodeReview.find(params[:id])
  end
end

# acho que é received_challenge aqui
