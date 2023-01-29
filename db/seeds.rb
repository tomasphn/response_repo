# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed users to author ai generated responses/reactions
User.create!(email: "john.doe@example.com", password: "password1")
User.create!(email: "jane.doe@example.com", password: "password2")
User.create!(email: "jim.smith@example.com", password: "password3")
User.create!(email: "emily.brown@example.com", password: "password4")
User.create!(email: "michael.lee@example.com", password: "password5")