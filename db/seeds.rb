# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Case.destroy_all

# Create doctors
5.times do |i|
  doctor = User.create(
    user_type: 'doctor',
    email: Faker::Internet.email,
    password: 'password1',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    # pesel: Faker::IDNumber.brazilian_citizen_number,
    # address: Faker::Address.full_address,
    # phone: "+48555123422",
    pwz_number: "6554327A",
    dob: Faker::Date.between(from: 25.days.ago, to: 45.years.ago),
    # weight: rand(65..95),
    # height: rand(159..185),
    sex: ['m', 'f'].sample
  )
end

# Create patients
20.times do |i|
  patient = User.create(
    user_type: 'patient',
    email: Faker::Internet.email,
    password: 'password1',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    pesel: Faker::IDNumber.brazilian_citizen_number,
    # address: Faker::Address.full_address,
    phone: "+48555123422",
    # pwz_number: "6554327A",
    dob: Faker::Date.between(from: 25.days.ago, to: 45.years.ago),
    weight: rand(65..95),
    height: rand(159..185),
    sex: ['m', 'f'].sample
  )
  # Create closed cases
  3.times do |i|
    Case.create(
      patient: patient,
      description: Faker::Lorem.paragraphs.join(''),
      solution: Faker::Lorem.paragraphs.join(''),
      doctor: User.doctor.all.sample,
      status: 'closed'
    )
  end

  # Create active case
  Case.create(
    patient: patient,
    description: Faker::Lorem.paragraphs.join(''),
    solution: Faker::Lorem.paragraphs.join(''),
    doctor: User.doctor.all.sample,
    status: 'active'
  )
end
