# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create!(email: "haha@haha.com", password: "123456")
start_time = DateTime.current
end_time = DateTime.current+1

event1 = Event.create!(
  user_id: user1.id,
  name: "Awesome party no. 100",
  location: "Humburg",
  price: 9000.95,
  capacity: 500_000,
  starts_at: start_time,
  ends_at: start_time,
  description: "Best party of your life!"
)



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
