class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookings, :flights
    add_foreign_key :passengers, :bookings
  end
end
