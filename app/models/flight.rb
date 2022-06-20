class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name:'Airport', foreign_key: 'departure_airport_id'
    belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'

    # def self.search(departure_airport_id, arrival_airport_id, start_date_time)
    #     where(['departure_airport_id=? AND arrival_airport_id=? AND start_date_time=?',"%#{departure_airport_id}%", "%#{arrival_airport_id}%", "%#{start_date_time}%"])
    # end
end
