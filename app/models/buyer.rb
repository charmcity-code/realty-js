class Buyer < ApplicationRecord
  has_many :appointments
  has_many :listings, through: :appointments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
