# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
Flight.destroy_all

airports=Airport.create!([{code: "HAN", location: "Hanoi"}, {code: "SGN", location: "Ho Chi Minh City"}, {code: "DAD", location: "Da Nang"}, {code: "CXR", location: "Cam Ranh"},{code: "DLI", location: "Da Lat"},{code: "PQC", location: "Phu Quoc"},{code: "HPH", location: "Hai Phong"},{code: "UIH", location: "Quy Nhon"}])


40.times do
    da_id = Airport.order(Arel.sql('RANDOM()')).first.id
    aa_id = Airport.order(Arel.sql('RANDOM()')).where('id != ?', da_id).first.id
    d_time = rand(30.days).seconds.from_now
    duration = rand(100..250)
    Flight.create(departure_airport_id: da_id, arrival_airport_id: aa_id, start_date_time: d_time, duration: duration)
end