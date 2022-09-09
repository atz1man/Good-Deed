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

# 1 Recipieint
1.times do
  recipient = Recipient.create(
    user: admin,
    name: Faker::FunnyName.name,
    bio: "I recently became divorced, after I became divorced also lost my job 😔 ",

  )
  recipient.save!
  qrcode = RQRCode::QRCode.new("https://good-deed1.herokuapp.com/recipients/#{recipient.id}")
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 1,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 10,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 250
    )

    Cloudinary::Uploader.upload("#{png.to_data_url}",
      :public_id => "qr_code#{recipient.id}",
      :use_filename => true
      )

  file = URI.open("https://images.unsplash.com/photo-1542367787-4baf35f3037d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80")
recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
recipient.save!

  puts "recipient profile created"
end

# 2 Second Recipient
1.times do
  recipient = Recipient.create(
    user: admin,
    name: Faker::FunnyName.name,
    bio: "The cost living has been increasing and could not afford rent 💸",

  )
  recipient.save!
  qrcode = RQRCode::QRCode.new("https://good-deed1.herokuapp.com/recipients/#{recipient.id}")
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 1,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 10,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 250
    )

    Cloudinary::Uploader.upload("#{png.to_data_url}",
      :public_id => "qr_code#{recipient.id}",
      :use_filename => true
      )

  file = URI.open("https://images.unsplash.com/photo-1529520161780-2573a0926b31?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80")
recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
recipient.save!

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

# 3 Second Recipient
1.times do
  recipient = Recipient.create(
    user: admin,
    name: Faker::FunnyName.name,
    bio: "Lost my dad and the death has really affected my mental health and things became incredibly terrible 😢 ",

  )
  recipient.save!
  qrcode = RQRCode::QRCode.new("https://good-deed1.herokuapp.com/recipients/#{recipient.id}")
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 1,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 10,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 250
    )

    Cloudinary::Uploader.upload("#{png.to_data_url}",
      :public_id => "qr_code#{recipient.id}",
      :use_filename => true
      )

  file = URI.open("https://images.unsplash.com/photo-1525898416124-a6464ad4dd84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80")
recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
recipient.save!

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
