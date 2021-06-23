# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p " ********************************* "
p " *                               * "
p " *             SEED              * "
p " *                               * "
p " ********************************* "

# Users
users = []

5.times do |n|
  names = Faker::Movies::HarryPotter.character.split(" ")
  users[n] = User.create!(
    first_name: names[0],
    last_name: names[1]? names[1] : names[0],
    phone: "075043905#{n}",
    email: "#{names[0]}.#{names[1]}0#{n}@yopmail.com",
    waiting_status: "reconfirmation_needed",
    confirmation_date: DateTime.now-16 
  )
end

5.times do |n|
  names = Faker::Movies::StarWars.character.split(" ")
  users[n] = User.create!(
    first_name: names[0],
    last_name: names[1]? names[1] : names[0],
    phone: "075603905#{n}",
    email: "#{names[0]}.#{names[1]}0#{n}@yopmail.com",
    waiting_status: "reconfirmation_needed",
    confirmation_date: DateTime.now-35 
  )
end

p "#{tp User.all}"
p "Creation Users... #{User.count}"
p "DONE"
p "-----------------------"
p "-----------------------"