class Donation < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :recipient
end
