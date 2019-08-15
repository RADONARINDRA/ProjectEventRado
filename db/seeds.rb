# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
2.times do
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraphs,
        email: Faker::Internet.free_email, encrypted_passeword: Faker::Internet.password)
    user.save
end
puts "Je vous souhaite la bienvenu"
20.times do
    event = Event.create( title: "Mon super event ",
                   description: "La description super event",
                   price: rand(1...1000),
                   location: Faker::Address.city,
                   start_date: Faker::Date.forward,
                   duration: 5*rand(1..120),
                   user_id: User.all.sample.id)
end
puts "Bonne visite"
2.times do
    attendance = Attendance.create(stripe_customer_id: Faker::Lorem.characters,event_id: Event.all.sample.id,
        user_id: User.all.sample.id)
    attendance.save
end
puts "Je vous remercie"