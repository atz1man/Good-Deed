#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

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

# puts "creating recipient profiles"

# 1 Recipieint
# 1.times do
#   recipient = Recipient.create(
#     user: admin,
#     name: Faker::Name.name,
#     bio: "My wife and I split up and she kept the house.  I couldnt afford to pay rent in the area. I started sleeping on friends sofas but I didn't want to be a burden so I ended up on the streets",
#   )
#   recipient.save!
#   qrcode = RQRCode::QRCode.new("https://good-deed.co/recipients/#{recipient.id}")
#     png = qrcode.as_png(
#       bit_depth: 1,
#       border_modules: 1,
#       color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#       color: "black",
#       file: nil,
#       fill: "white",
#       module_px_size: 10,
#       resize_exactly_to: false,
#       resize_gte_to: false,
#       size: 250
#     )

#     Cloudinary::Uploader.upload("#{png.to_data_url}",
#       :public_id => "qr_code#{recipient.id}",
#       :use_filename => true
#       )

#   file = URI.open("https://images.unsplash.com/photo-1580518324671-c2f0833a3af3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!

#   puts "recipient profile created"
# end

# # 2 Second Recipient
# 1.times do
#   recipient = Recipient.create(
#     user: admin,
#     name: Faker::Name.name,
#     bio: "The cost of living has been increasing and could not afford my mortgage.  I lost my flat and started renting but that was even more expensive, so I ended up sleeping rough some nights.",

#   )
#   recipient.save!
#   qrcode = RQRCode::QRCode.new("https://localhost:3000//recipients/#{recipient.id}")
#     png = qrcode.as_png(
#       bit_depth: 1,
#       border_modules: 1,
#       color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#       color: "black",
#       file: nil,
#       fill: "white",
#       module_px_size: 10,
#       resize_exactly_to: false,
#       resize_gte_to: false,
#       size: 250
#     )

#     Cloudinary::Uploader.upload("#{png.to_data_url}",
#       :public_id => "qr_code#{recipient.id}",
#       :use_filename => true
#       )

#   file = URI.open("https://images.unsplash.com/photo-1624395213043-fa2e123b2656?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!

#   puts "recipient profile created"
# end


# puts "------------------"
# puts "recipient profiles have been created"
# puts "------------------"

# # puts "creating donations"
# # 5.times do
# #   Donation.create(
# #     amount: rand(3..10),
# #     user: user1,
# #     recipient: Recipient.first
# #   )
# #   puts "donation created"
# # end


# # 3 Second Recipient
# 1.times do
#   recipient = Recipient.create(
#     user: admin,
#     name: Faker::Name.name,
#     bio: "I lost my dad and it has really affected my mental health. Every day tasks became impossible and I was missing days of work.  My zero hours contract meant I had no safety net and I lost everything",

#   )
#   recipient.save!
#   qrcode = RQRCode::QRCode.new("https://good-deed1.herokuapp.com/recipients/#{recipient.id}")
#     png = qrcode.as_png(
#       bit_depth: 1,
#       border_modules: 1,
#       color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#       color: "black",
#       file: nil,
#       fill: "white",
#       module_px_size: 10,
#       resize_exactly_to: false,
#       resize_gte_to: false,
#       size: 250
#     )

#     Cloudinary::Uploader.upload("#{png.to_data_url}",
#       :public_id => "qr_code#{recipient.id}",
#       :use_filename => true
#       )

#   file = URI.open("https://images.unsplash.com/photo-1606335192038-f5a05f761b3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!

#   puts "recipient profile created"
# end

# puts "------------------"
# puts "recipient profiles have been created"
# puts "------------------"

# puts "creating donations"
# 5.times do
#   Donation.create(
#     amount: rand(3..10),
#     user: user1,
#     recipient: Recipient.first
#   )
#   puts "donation created"
# end

puts "------------------"
puts "finished creating everything"
