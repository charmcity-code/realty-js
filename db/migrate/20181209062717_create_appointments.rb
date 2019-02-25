class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :date
      t.integer :buyer_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
