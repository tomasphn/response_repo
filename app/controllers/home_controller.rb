class HomeController < ApplicationController
  def index
    @prompts = Prompt.all
  end
end
