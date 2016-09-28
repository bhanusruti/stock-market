# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   name = Faker::Company.name
#   code = name[0..4].upcase

#   company = Company.new(company_name: name, company_code: code)
#   company.save
# end
# puts "Done"


200.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "abc"

  user = User.new(first_name: first_name, last_name: last_name, email: email, password: password)
  user.save
end

puts "Done"