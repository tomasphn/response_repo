class HomeController < ApplicationController
  def index
    @prompt = Prompt.order("RANDOM()").first
  end

  def search
    text = params[:prompt_text]
    # need to change so that it checks regardless of case + mispellings
    if Prompt.exists?(text: text)
      @prompt = Prompt.find_by(text: text)
    else
      @prompt = Prompt.create(text: text)
      @prompt.generate_responses_reactions
    end
    render 'prompts/show'
  end
end
