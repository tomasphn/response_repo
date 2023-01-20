class ResponseController < ApplicationController
  def create
    response = @response.new
    
  end

  def index
    @responses = Response.all_and_reactions
  end
end
