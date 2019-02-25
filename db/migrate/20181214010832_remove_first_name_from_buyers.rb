class RemoveFirstNameFromBuyers < ActiveRecord::Migration[5.2]
  def change
    remove_column :buyers, :first_name
  end
end
