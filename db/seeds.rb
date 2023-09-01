# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

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
  
# Admin
User.create!(
  first_name: "Odin",
  last_name: "Boss",
  mobile_number: 11111111,
  email: "admin@example.com",
  password: "123456",
  birthdate: "2010-10-10",
  gender: 1,
  location_country: "PH",
  location_state: "Olympus",
  location_city: "Valhalla",
  school: "N/A",
  bio: "N/A",
  gender_interest: 1,
  isAdmin: true
)

User.create!(
  first_name: "Emma",
last_name: "Johnson",
mobile_number: 5551234561,
email: "test1@example.com",
password: "123456",
birthdate: "1995-03-15",
gender: 0,
location_country: "US",
location_state: "California",
location_city: "Los Angeles",
school: "University of XYZ",
bio: "Lover of art and nature.",
gender_interest: 1

)

User.create!(
  first_name: "Liam",
last_name: "Smith",
mobile_number: 5551234562,
email: "test2@example.com",
password: "123456",
birthdate: "1992-09-21",
gender: 1,
location_country: "US",
location_state: "New York",
location_city: "Brooklyn",
school: "City College",
bio: "Music enthusiast and aspiring guitarist.",
gender_interest: 0

)
User.create!(
  first_name: "Olivia",
last_name: "Brown",
mobile_number: 5551234563,
email: "test3@example.com",
password: "123456",
birthdate: "1998-07-08",
gender: 0,
location_country: "CA",
location_state: "Ontario",
location_city: "Toronto",
school: "University of ABC",
bio: "Bookworm and travel enthusiast.",
gender_interest: 1
)

User.create!(first_name: "Noah",
  last_name: "Davis",
  mobile_number: 5551234564,
  email: "test4@example.com",
  password: "123456",
  birthdate: "1994-12-03",
  gender: 1,
  location_country: "AU",
  location_state: "Victoria",
  location_city: "Melbourne",
  school: "Melbourne University",
  bio: "Fitness and health advocate.",
  gender_interest: 0
  )



  
  