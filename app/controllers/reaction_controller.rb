class ReactionController < ApplicationController
  def create
    @reaction = Reaction.new(params[:reaction])
    # check if reaction of same type for user on same post already exists
    # if not, register new reaction
    # emotion, user_id, response_id
    # re render the page
  end
end
