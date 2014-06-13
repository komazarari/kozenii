# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'DEFAULT USERS'
[
 { username: ENV['ADMIN_NAME'].dup, password: ENV['ADMIN_PASSWORD'].dup, role: "admin" },
 { username: "user", password: "changeme", role: "user" },
].each do |p|
  user = User.find_or_create_by(username: p[:username])
  user.update(password: p[:password], role: p[:role])
  puts 'user: ' << user.username
end
