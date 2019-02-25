class Appointment < ApplicationRecord
  belongs_to :buyer
  belongs_to :listing

  validates :date, presence: true

  #custom setters and getters (convenience attributes on models)

  def buyer_name=(name)
    self.buyer = Buyer.find_or_create_by(name: name)
  end

  def buyer_name
    self.buyer ? self.buyer.name : nil
  end

  def listing_street=(street)
    self.listing = Listing.find_or_create_by(street: street)
  end

  def listing_street
    self.listing ? self.listing.street : nil
  end
end