class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show, :create]

  def index
  end

  def new
    @prompt = Prompt.new
  end

  def show
  end

  def create
    @prompt = Prompt.new(prompt_params)
    challenge_response = ChallengePromptService.new(@prompt).call
    @prompt.received_challenge = challenge_response
    @prompt.save
  end

  private

  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  def prompt_params
    params.require(:prompt).permit(:programming_language, :level, :job_title, :job_field, :key_values)
  end
end
