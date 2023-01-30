class Response < ApplicationRecord
  belongs_to :prompt
  belongs_to :user
  has_many :reactions, dependent: :destroy

  def reaction_counts
    instances = reactions.pluck(:emotion)
    p %w(likes loves haha wow sad angry).map {|emotion| [emotion, instances.count(emotion)]}.to_h
  end

  def user_reaction_check(current_user)
    user_reactions = reactions.where(user_id: current_user.id).pluck(:emotion)
    %w(likes loves haha wow sad angry).map {|emotion| [emotion, user_reactions.include?(emotion)]}.to_h
  end

  def user_reaction(current_user, emotion)
    reactions.find_by(user_id: current_user.id, emotion: emotion)
  end
end
