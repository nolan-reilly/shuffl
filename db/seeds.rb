# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [
  { username: "user", name: "name", email: "user@gmail.com", password: "password" },
  { username: "john", name: "John Doe", email: "john@gmail.com", password: "password" },
  { username: "joe", name: "Joe Doe", email: "joe@gmail.com", password: "password" },
  { username: "jane", name: "Jane Doe", email: "jane@gmail.com", password: "password" },
  { username: "bob", name: "Bob Doe", email: "bob@gmail.com", password: "password" }
]

users.each do |user_attrs|
  User.create!(user_attrs)
end
