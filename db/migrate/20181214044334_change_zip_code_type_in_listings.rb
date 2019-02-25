class ChangeZipCodeTypeInListings < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :zip_code, :string
  end
end
