# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require './db/comments_seed'

facilities = ['New York', 'Los Angeles', 'Portland']
for facility in facilities
  Facility.create(location: facility)
end

appointmentment_types = ['Allergist', 'Surgeon', 'Primary Care', 'Cardiologist']
for appt in appointmentment_types
  AppointmentType.create(type_of_appointment: appt)
end