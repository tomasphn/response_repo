class Response < ApplicationRecord
  belongs_to :prompt
  belongs_to :user
  has_many :reactions, dependent: :destroy

  def reaction_counts
    reactions.pluck(:emotion).tally
  end

  def user_reaction_check
    # change once can actually check user id
    user_id = 1
    user_reactions = reactions.where(user_id: user_id).pluck(:emotion)
    %w(likes loves haha wow sad angry).map {|emotion| [emotion, user_reactions.include?(emotion)]}.to_h
  end
end
