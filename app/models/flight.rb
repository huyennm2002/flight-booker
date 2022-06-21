class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name:'Airport', foreign_key: 'departure_airport_id'
    belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'

    scope :by_da, lambda {|da| where {:departure_airport_id => da}}
    scope :by_aa, lambda {|aa| where {:arrival_airport_id => aa}}
    scope :by_date, lambda {|date| where {:start_date_time => date}} 
    
end
