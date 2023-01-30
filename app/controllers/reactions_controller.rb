class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reaction = Reaction.create(reaction_params)
    redirect_to prompt_path(params[:prompt_id])
  end

  def destroy
    @reaction = Reaction.find(params[:id])
    @reaction.destroy

    redirect_to prompt_path(params[:prompt_id])
  end

  private

  def reaction_params
    params.require(:reaction).permit(:emotion, :user_id, :response_id)
  end
end
