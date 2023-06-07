class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show]

  def index
    @prompts = Prompt.all
  end

  def new
    @prompt = Prompt.new
  end

  def show
    @code_review = CodeReview.new
  end

  def create
    @prompt = Prompt.new(prompt_params)
    @user = current_user
    @prompt.user = @user
    challenge_response = ChallengePromptService.new(@prompt).call

    @prompt.received_challenge = challenge_response
    if @prompt.save
      redirect_to prompt_path(@prompt)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  def prompt_params
    params.require(:prompt).permit(:programming_language, :level, :job_title, :job_field, :key_values)
  end
end
