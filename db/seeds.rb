#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


puts "cleaning database"
Donation.destroy_all
Recipient.destroy_all
User.destroy_all
puts "creating users"
puts "------------------"

user1 = User.create(
  email: 'rizwan@gmail.com',
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  admin: false
)

2.times do
    user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    admin: false
  )
  puts user.email
  puts user.save!
end
puts "------------------"

    admin = User.create(
    email: 'admin@gmail.com',
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    admin: true
  )
  puts "admin #{User.last.admin} user created"
  puts admin.save!

puts "------------------"
puts "All users have been created"
puts "------------------"

puts "creating recipient profiles"

3.times do
   Recipient.create(
    user: admin,
    name: Faker::FunnyName.name,
    bio: Faker::Book.title,
    profile_photo: Faker::LoremPixel.image,
    qr_code: Faker::Barcode.ean
  )
  puts "recipient profile created"
end

puts "------------------"
puts "recipient profiles have been created"
puts "------------------"

puts "creating donations"
5.times do
  Donation.create(
    amount: rand(3..10),
    user: user1,
    recipient: Recipient.first
  )
  puts "donation created"
end



puts "------------------"
puts "finished creating everything"
