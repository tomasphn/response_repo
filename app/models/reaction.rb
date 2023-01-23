class Reaction < ApplicationRecord
  belongs_to :response
  belongs_to :user

  validates :emotion, presence: true, inclusion: { in: %w(love funny sad happy) }
end
