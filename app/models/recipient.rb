class Recipient < ApplicationRecord
  belongs_to :user
  has_many :donations, dependent: :destroy
  # has_many :donators, through: :donations, source: :user
  has_one_attached :photo


  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_bio,
  # against: [ :name, :bio ],
  # using: {
  #   tsearch: { prefix: true } # <-- now `superman batm` will return something!
  # }
end
