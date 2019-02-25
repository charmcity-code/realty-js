class RemoveListDateFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :list_date, :string
  end
end
