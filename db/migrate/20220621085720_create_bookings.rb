class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :no_of_passengers
      t.integer :passenger_id
      t.integer :confirmation_number

      t.timestamps
    end
  end
end
