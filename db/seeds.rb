# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Photo.destroy_all
User.destroy_all
Theme.destroy_all

sci_fi = Theme.create!(name:"Science Fiction")
medieval = Theme.create!(name:"Medieval")
post_modern = Theme.create!(name:"Post-Modernism")
circus = Theme.create!(name:"Circus' in town")
eight_bit = Theme.create!(name:"8-Bit")
zombies = Theme.create!(name:"All your zombies are belong to us")
hackers = Theme.create!(name:"Hack all the things!")
chocolate = Theme.create!(name: "Chocolate connaisseurs")

user1 = User.create!(email: "a@a.a", password: "aaaaaa")
user2 = User.create!(email: "henk@frietisgoud.lekkah", password: "lekker")


start_time = DateTime.current
end_time = start_time+1


event1 = Event.create!(
  user_id: user1.id,
  name: "Awesome party no. 100",
  location: Faker::Address.city,
  price: Faker::Number.decimal(3),
  category: "Dance",
  capacity: Faker::Number.number(5),
  starts_at: start_time,
  ends_at: end_time,
  includes_food: true,
  includes_drinks: true,
  description: Faker::VForVendetta.speech[0..496] << "...",
  themes: [zombies, eight_bit, circus]
)


event2 = Event.create!(
  user_id: user1.id,
  name: "Awesome party no. 105",
  location: Faker::Address.city,
  price: Faker::Number.decimal(3),
  category: "Movie",
  capacity: Faker::Number.number(5),
  starts_at: start_time,
  ends_at: end_time,
  includes_food: true,
  includes_drinks: true,
  description: Faker::VForVendetta.speech[0..496] << "...",
  themes: [medieval, post_modern, chocolate]
)

scifi_photo = Photo.create!(remote_image_url: 'http://res.cloudinary.com/duplhjlsw/image/upload/v1513262448/scifi_c0szap.jpg', event: event1)
medieval_photo = Photo.create!(remote_image_url: 'http://res.cloudinary.com/duplhjlsw/image/upload/v1513262449/medieval_hyxyt8.jpg', event: event2)
#
# # puts "Created #{event1.name}." if event1
#
# event2 = Event.create!(
#   user_id: user1.id,
#   name: "Awesome party no. 105",
#   location: "Berlin",
#   price: 9001,
#   category: "Movie",
#   capacity: 500_001,
#   starts_at: start_time,
#   ends_at: end_time,
#   includes_food: true,
#   includes_drinks: true,
#   description: "Better party of your life!",
#   themes: [medieval, post_modern, chocolate]
# )
# puts "Created #{event2.name}." if event2

# t.string :name
# t.text :description
# t.string :location
# t.decimal :price = 0
# t.integer :capacity
# t.boolean :includes_food = false
# t.boolean :includes_drinks = false
# t.datetime :starts_at
# t.datetime :ends_at
# t.boolean :active = true
