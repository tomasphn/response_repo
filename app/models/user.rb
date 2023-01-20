class User < ApplicationRecord
  has_many :responses, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
