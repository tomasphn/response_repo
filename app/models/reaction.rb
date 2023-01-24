class Reaction < ApplicationRecord
  belongs_to :response
  belongs_to :user

  validates :emotion, presence: true, inclusion: { in: %w(likes loves haha wow sad angry) }
end
