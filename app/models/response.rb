class Response < ApplicationRecord
  belongs_to :prompt
  belongs_to :user
  has_many :reactions, dependent: :destroy

  class << self
    def all_and_reactions
      Response.find_each.map do |response|
        attributes = response.attributes
        attributes["reactions"] = emotion_count(response[:id])
        attributes
      end
    end

    def emotion_count(id)
      Response.joins(:reactions).where("responses.id = #{id}").group('reactions.emotion').count
    end
  end
end
