# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'date'
puts 'Destroying existing data...'
Post.destroy_all
User.destroy_all

puts 'Creating users...'
xun = User.new(first_name: 'Xunie', last_name: 'Ma', email: 'xun@mail.com', password: '123456')
xun.save!

3.times do
  first_name = Faker::GreekPhilosophers.name
  last_name = Faker::Cat.name
  user = User.new(first_name: first_name, last_name: last_name, email: "#{first_name}@mail.com", password: '123456')
  user.save!
end

puts 'creating posts...'
(1..10).to_a.each do |num|
  title = Faker::HitchhikersGuideToTheGalaxy.specie
  content = Faker::HitchhikersGuideToTheGalaxy.quote
  post = Post.new(
    title: title,
    content: content,
    date: (Date.today - num),
    user_id: rand(User.first.id..User.last.id)
  )
  post.save!
end

puts "You're all set!"
