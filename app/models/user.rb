class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true

  has_many :responses, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
