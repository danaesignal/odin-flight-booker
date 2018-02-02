# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.create(code: "SFO")
Airport.create(code: "NYC")

Airport.first.departures.create(destination_id: Airport.last.id, departure: 1.hour.from_now, duration: 1.hour)
Airport.first.departures.create(destination_id: Airport.last.id, departure: 1.day.from_now, duration: 1.hour)
Airport.first.departures.create(destination_id: Airport.last.id, departure: 1.week.from_now, duration: 1.hour)

Airport.last.departures.create(destination_id: Airport.first.id, departure: 2.hours.from_now, duration: 1.hour)
Airport.last.departures.create(destination_id: Airport.first.id, departure: 2.days.from_now, duration: 1.hour)
Airport.last.departures.create(destination_id: Airport.first.id, departure: 2.weeks.from_now, duration: 1.hour)