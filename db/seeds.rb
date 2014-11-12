# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(email: 'blee298@gmail.com', password: '123')
User.create(email: 'brandonlee60@hotmail.com', password: '123', admin: true)
Movie.create(title: 'Braveheart', director: 'Mel Gibson')
require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    firstname { Faker::Name.first_name }
    lastname  { Faker::Name.last_name }
    email     { Faker::Internet.safe_email }
    password '123456'
    password_confirmation '123456'
  end

  # factory :review do
  #   rating_out_of_ten { rand(10) }
  #   text  { Faker::Lorem.paragraph }
  # end

end


10.times do
  u = FactoryGirl::build(:user)
  u.save
end