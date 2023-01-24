class Reaction < ApplicationRecord
  belongs_to :response
  belongs_to :user

  validates :emotion, presence: true, inclusion: { in: %w(likes loves haha wow sad angry) }
  validates_uniqueness_of :emotion, :response_id, :user_id, scope: [:emotion, :response_id, :user_id]
end
