class ChangeLastNametoNameInBuyers < ActiveRecord::Migration[5.2]
  def change
    rename_column :buyers, :last_name, :name
  end
end
