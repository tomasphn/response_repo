class ResponsesController < ApplicationController
  before_action :authenticate_user!

  def create
    @prompt = Prompt.find(params[:prompt_id])
    @prompt.responses.create(response_params)
    redirect_to prompt_path(@prompt), notice: 'Your response has been submitted'
  end

  def show
    @response = Response.find(params[:id])
  end

  def index
    @responses = Response.all
  end

  def edit
    @response = Response.find(params[:id])
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    @prompt = Prompt.find(params[:prompt_id])
    redirect_to prompt_path(@prompt), notice: 'Your response has been deleted'
  end

  private

  def response_params
    params.require(:response).permit(:text, :user_id)
  end
end
