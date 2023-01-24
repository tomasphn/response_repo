class PromptController < ApplicationController
  def create
    @prompt = Prompt.new(params[:text])
  end

  def show
    @prompt = Prompt.create("test prompt")
    @prompt.generate_responses_reactions
  end
end
