class RevertListPriceToIntegerInListings < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :list_price, :integer
  end
end
