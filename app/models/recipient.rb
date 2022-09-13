class Recipient < ApplicationRecord
  belongs_to :user
  has_many :donations, dependent: :destroy
  has_many :messages, dependent: :destroy
  # has_many :donators, through: :donations, source: :user
  has_one_attached :photo
end
