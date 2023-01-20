class Prompt < ApplicationRecord
  has_many :responses, dependent: :destroy
end
