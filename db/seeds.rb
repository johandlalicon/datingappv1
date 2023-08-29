# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Generate 10 random users
50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mobile_number: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    gender: User.genders.values.sample,  # Use the enum mapping method here
    location_country: Faker::Address.country,
    location_state: Faker::Address.state,
    location_city: Faker::Address.city,
    school: Faker::Educator.university,
    bio: Faker::Lorem.paragraph,
    gender_interest: User.gender_interests.values.sample  # Use the enum mapping method here
  )

  end
  