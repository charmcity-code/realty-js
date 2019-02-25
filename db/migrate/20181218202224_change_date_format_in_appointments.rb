class ChangeDateFormatInAppointments < ActiveRecord::Migration[5.2]
  def up
    change_column :appointments, :date, :datetime
  end

  def down
    change_column :appointments, :date, :string
  end
end
