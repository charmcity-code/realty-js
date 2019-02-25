class Listing < ApplicationRecord
  belongs_to :user
	has_many :appointments
	has_many :buyers, through: :appointments

	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true, length: { is: 2 }
	validates :zip_code, presence: true, length: { minimum: 5 }
	validates :list_price, presence: true

end
