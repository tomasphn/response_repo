class ResponsesController < ApplicationController
  def create
    @prompt = Prompt.find(params[:prompt_id])
    @prompt.responses.create(response_params)
    redirect_to prompt_path(@prompt)
  end

  def show
    @response = Response.find(1)
  end

  def index
    @responses = Response.all
  end

  private

  def response_params
    params.require(:response).permit(:text, :user_id)
  end
end
