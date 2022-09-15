#   movies = Movie.create([{ name: “Star Wars” }, { name: “Lord of the Rings” }])
#   Character.create(name: “Luke”, movie: movies.first)
require 'faker'
require "open-uri"
puts "cleaning database"
Donation.destroy_all
Recipient.destroy_all
User.destroy_all
puts "creating users"
puts "------------------"
user1 = User.create(
  email: "rizwan@gmail.com",
  password: "123456",
  first_name: "Esther",
  last_name: "Louise",
  admin: false
)
puts "------------------"
    admin = User.create(
    email: "admin@gmail.com",
    password: "123456",
    first_name: "Jack",
    last_name: "Frank",
    admin: true
  )

puts "admin #{User.last.admin} user created"
puts admin.save!
puts "------------------"

# 1 Recipieint
1.times do
  recipient = Recipient.create(
    user: admin,
    name: "Mark",

    bio: "My wife and I split up and she kept the house.  I couldnt afford to pay rent in the area. I started sleeping on friends sofas but I didn't want to be a burden so I ended up on the streets",
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

  file = URI.open("https://images.unsplash.com/photo-1568927198336-e9ae04365910?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
recipient.save!
puts "creating recipient 1"
#<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Second seed  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# 1.times do
  recipient = Recipient.create(
    user: admin,
    name: "Tim",

    bio: "Hi there, I have been struggling with addiction since I was young due to family issues.  I really want to turn my life around but feel in an impossible position",
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

  file = URI.open("https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
recipient.save!
puts "creating recipient 2"
#<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Third seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# 1.times do
recipient = Recipient.create(
  user: admin,
  name: "Josh",

  bio: "Hello friends! As we all know the cost of living has increased which meant I couldn't pay my mortgage, I have been homeless since 2021 and really appreciate any help. ",
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

file = URI.open("https://images.unsplash.com/photo-1624395213043-fa2e123b2656?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
recipient.save!
puts "creating recipient 3"
#<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Fourth seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# 1.times do
recipient = Recipient.create(
  user: admin,
  name: "Sue",

  bio: "Hi there, I have been struggling with addiction since I was young due to family issues.  I really want to turn my life around but feel in an impossible position",
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

file = URI.open("https://images.unsplash.com/photo-1596813362035-3edcff0c2487?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80")
recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
recipient.save!
puts "creating recipient 4"
  end
# #<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Five seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# # 1.times do
# recipient = Recipient.create(
#   user: admin,
#   name: Faker::Name.name,

#   bio: "  DebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebugging ",
# )
# recipient.save!
# qrcode = RQRCode::QRCode.new("https://good-deed.co/recipients/#{recipient.id}")

#   png = qrcode.as_png(
#     bit_depth: 1,
#     border_modules: 1,
#     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#     color: "black",
#     file: nil,
#     fill: "white",
#     module_px_size: 10,
#     resize_exactly_to: false,
#     resize_gte_to: false,
#     size: 250
#   )


#   Cloudinary::Uploader.upload("#{png.to_data_url}",
#     :public_id => "qr_code#{recipient.id}",
#     :use_filename => true
#     )

# file = URI.open("https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!
# puts "creating recipient 5"
# #<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Six seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# recipient = Recipient.create(
#   user: admin,
#   name: Faker::Name.name,

#   bio: "  DebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebugging ",
# )
# recipient.save!
# qrcode = RQRCode::QRCode.new("https://good-deed.co/recipients/#{recipient.id}")

#   png = qrcode.as_png(
#     bit_depth: 1,
#     border_modules: 1,
#     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#     color: "black",
#     file: nil,
#     fill: "white",
#     module_px_size: 10,
#     resize_exactly_to: false,
#     resize_gte_to: false,
#     size: 250
#   )


#   Cloudinary::Uploader.upload("#{png.to_data_url}",
#     :public_id => "qr_code#{recipient.id}",
#     :use_filename => true
#     )

# file = URI.open("https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!
# puts "creating recipient 6"
# #<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7 seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# recipient = Recipient.create(
#   user: admin,
#   name: Faker::Name.name,

#   bio: "  DebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebugging ",
# )
# recipient.save!
# qrcode = RQRCode::QRCode.new("https://good-deed.co/recipients/#{recipient.id}")

#   png = qrcode.as_png(
#     bit_depth: 1,
#     border_modules: 1,
#     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#     color: "black",
#     file: nil,
#     fill: "white",
#     module_px_size: 10,
#     resize_exactly_to: false,
#     resize_gte_to: false,
#     size: 250
#   )


#   Cloudinary::Uploader.upload("#{png.to_data_url}",
#     :public_id => "qr_code#{recipient.id}",
#     :use_filename => true
#     )

# file = URI.open("https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!
# puts "creating recipient 7"
# #<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8 seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# recipient = Recipient.create(
#   user: admin,
#   name: Faker::Name.name,

#   bio: "  DebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebugging ",
# )
# recipient.save!
# qrcode = RQRCode::QRCode.new("https://good-deed.co/recipients/#{recipient.id}")

#   png = qrcode.as_png(
#     bit_depth: 1,
#     border_modules: 1,
#     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#     color: "black",
#     file: nil,
#     fill: "white",
#     module_px_size: 10,
#     resize_exactly_to: false,
#     resize_gte_to: false,
#     size: 250
#   )


#   Cloudinary::Uploader.upload("#{png.to_data_url}",
#     :public_id => "qr_code#{recipient.id}",
#     :use_filename => true
#     )

# file = URI.open("https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!
# puts "creating recipient 8"
#   # end
# # #<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9 seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# recipient = Recipient.create(
#   user: admin,
#   name: Faker::Name.name,

#   bio: "  DebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebugging ",
# )
# recipient.save!
# qrcode = RQRCode::QRCode.new("https://good-deed.co/recipients/#{recipient.id}")

#   png = qrcode.as_png(
#     bit_depth: 1,
#     border_modules: 1,
#     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#     color: "black",
#     file: nil,
#     fill: "white",
#     module_px_size: 10,
#     resize_exactly_to: false,
#     resize_gte_to: false,
#     size: 250
#   )


#   Cloudinary::Uploader.upload("#{png.to_data_url}",
#     :public_id => "qr_code#{recipient.id}",
#     :use_filename => true
#     )

# file = URI.open("https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!
# puts "creating recipient 9"
# # #<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 seed recipient>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# recipient = Recipient.create(
#   user: admin,
#   name: Faker::Name.name,

#   bio: "  DebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebuggingDebugging ",
# )
# recipient.save!
# qrcode = RQRCode::QRCode.new("https://good-deed.co/recipients/#{recipient.id}")

#   png = qrcode.as_png(
#     bit_depth: 1,
#     border_modules: 1,
#     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#     color: "black",
#     file: nil,
#     fill: "white",
#     module_px_size: 10,
#     resize_exactly_to: false,
#     resize_gte_to: false,
#     size: 250
#   )


#   Cloudinary::Uploader.upload("#{png.to_data_url}",
#     :public_id => "qr_code#{recipient.id}",
#     :use_filename => true
#     )

# file = URI.open("https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
# recipient.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# recipient.save!
# puts "creating recipient 10"
#   end
# # #<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Recipient End>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
