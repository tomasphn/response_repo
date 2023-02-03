class PromptsController < ApplicationController
  def create
    @prompt = Prompt.new(params[:text])
  end

  def show
    @prompt = Prompt.find(params[:id])
  end

  private

  def prompt_params
    params.require(:text)
  end
end
