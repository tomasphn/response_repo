class ReactionsController < ApplicationController
  def create
    @reaction = Reaction.create(params[:reaction])
    redirect_to prompt_path(params[:prompt_id])
  end

  def destroy
    @reaction = Reaction.find(params[:id])
    @reaction.destroy

    redirect_to prompt_path(params[:prompt_id])
  end
end
