# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Doctor.destroy_all
Education.destroy_all
Patient.destroy_all

6.times do
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: ["Dr", "Prof"].sample,
    available: [true, false].sample,
    emoji_avatar: ["👩🏻‍⚕️", "👩🏼‍⚕️", "👩🏽‍⚕️", "👩🏿‍⚕️", "🧑🏻‍⚕️", "🧑‍⚕️", "🧑🏽‍⚕️", "👨🏻‍⚕️", "👨‍⚕️", "👨🏽‍⚕️", "👨🏾‍⚕️"].sample,
    speciality: ["Dermatologist", "Pneumologist", "Cardiolgist", "Dentist", "GP"].sample,
    experience: rand(2..6)
  )
end



Patient.create!(
  first_name: "Adam",
  last_name: "Tomczyk",
  insurance: ["Public", "Private"].sample,
  gender: "M",
  emoji_avatar: "👨🏻",
  age: 34
)
