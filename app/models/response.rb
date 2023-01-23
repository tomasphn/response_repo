class Response < ApplicationRecord
  belongs_to :prompt
  belongs_to :user
  has_many :reactions, dependent: :destroy

  def reaction_count
    reactions.map do |reaction|
      reaction.emotion
    end.tally
  end
end
