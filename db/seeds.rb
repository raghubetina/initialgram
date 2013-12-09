# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  User.destroy_all
  Follow.destroy_all
end

('a'..'z').each do |letter|
  u = User.new
  u.username = letter*3
  u.email = "#{letter}@example.com"
  u.password = "11111111"
  u.password_confirmation = "11111111"
  u.save
end

puts "There are #{User.count} users in the database."

User.order('username DESC').each do |follower|
  following = User.all.sample(10) - [follower]
  following.each do |user|
    f = Follow.new
    f.follower = follower
    f.followee = user
    f.save
  end
end

puts "There are #{Follow.count} follows in the database."



