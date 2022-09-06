#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


puts "cleaning database"
User.destroy_all
puts "creating users"
puts "------------------"

3.times do
    User.create(
    email: Faker::Internet.email,
    encrypted_password: "12345",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    admin: false
  )
  puts "normal user created"
end
puts "------------------"

3.times do
    User.create(
    email: Faker::Internet.email,
    encrypted_password: "12345",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    admin: true
  )
  puts "admin user created"
end


puts "------------------"
puts "All users have been created"
puts "------------------"

puts "creating recipient profiles"

3.times do
   Recipient.create(
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
    user_id: @user_id,
    recipient_id: @recipient_id
  )
  puts "donation created"
end



puts "------------------"
puts "finished creating everything"
