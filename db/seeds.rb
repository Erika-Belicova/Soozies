# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

require "faker"

puts "Destroying everything"

User.destroy_all
Soozie.destroy_all
Booking.destroy_all

puts "Seeding"

Rails.root.join("db/seeds/users").children.each do |filepath|
  username = filepath.to_s.split("/")[-1].split(".")[0]
  file = File.open(filepath)
  puts "Creating user #{username}"
  user = User.new(email: "#{username}@example.com", password: "password")
  user.photo.attach(io: file, filename: "#{username}.jpg", content_type: "image/jpg")
  user.save
end


Rails.root.join("db/seeds/soozies").children.each do |filepath|
  username = filepath.to_s.split("/")[-1].split(".")[0]
  file = File.open(filepath)
  puts "Creating soozie #{username}"
  soozie = Soozie.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user: User.all.sample)
  soozie.photo.attach(io: file, filename: "#{username}.jpg", content_type: "image/jpg")
  soozie.save
end
