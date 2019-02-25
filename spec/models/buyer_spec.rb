require 'rails_helper'

RSpec.describe Buyer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    let(:buyer) {
      Buyer.create(
      first_name: "Chase",
      last_name: "Horin",
      email: "chase@gmail.com"
      )
    }

  it "is valid with a first_name, last_name and email" do
    expect(buyer).to be_valid
  end
end
