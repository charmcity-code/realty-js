class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :property_type
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :list_price
      t.string :list_date
      t.integer :user_id

      t.timestamps
    end
  end
end
