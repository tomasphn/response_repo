class PromptController < ApplicationController
  def create
    @prompt = Prompt.new(params[:text])
  end

  def show
    @prompt = Prompt.find(params[:id])
    # need prompt
    # need generated responses
  end
end
