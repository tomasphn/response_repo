class HomeController < ApplicationController
  def index
    @prompts = Prompt.all
  end

  def search
    @prompt = Prompt.create(params[:search])
    render 'prompt'
  end
end
