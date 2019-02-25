class ChangeListPriceToStringInListings < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :list_price, :string
  end
end
