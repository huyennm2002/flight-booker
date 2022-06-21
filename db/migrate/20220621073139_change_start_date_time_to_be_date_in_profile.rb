class ChangeStartDateTimeToBeDateInProfile < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :start_date_time, :date
  end
end
