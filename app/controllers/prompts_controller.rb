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
  end

  private

  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  def prompt_params
    params.require(:prompt).permit(:programming_language, :job_title, :job_field, :key_values)
  end
end
