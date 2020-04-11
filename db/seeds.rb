User.destroy_all
Case.destroy_all

p "Creating doctors ..."

5.times do |i|
  doctor = Doctor.create(
    email: Faker::Internet.email,
    password: 'password1',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    pwz_number: "6554327A",
    dob: Faker::Date.between(from: 25.days.ago, to: 45.years.ago),
    sex: ['m', 'f'].sample
  )
end

p "Creating doctor for testing ..."

Doctor.create(
  email: "doctor@email.com",
  password: "password1",
  first_name: "James",
  last_name: "Smith",
  pwz_number: "6554327A",
  dob: Date.new(1990, 11, 11),
  sex: 'm'
)

p "Creating random patients and their cases ..."

20.times do |i|
  patient = Patient.create(
    email: Faker::Internet.email,
    password: 'password1',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    pesel: Faker::IDNumber.brazilian_citizen_number,
    phone: "+48555123422",
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
      doctor: Doctor.all.sample,
      status: 'closed'
    )
  end

  # Create active case
  Case.create(
    patient: patient,
    description: Faker::Lorem.paragraphs.join(''),
    solution: Faker::Lorem.paragraphs.join(''),
    doctor: Doctor.all.sample,
    status: 'active',
    covid_suspected: [false, false, false, false, false, false, false, true].sample
  )
end

p "Creating patient for testing ..."

Patient.create(
  email: "patient@email.com",
  password: "password1",
  first_name: "John",
  last_name: "Doe",
  pesel: "44051401458",
  phone: "+48555123444",
  dob: Date.new(1944, 5, 14),
  weight: 85,
  height: 180,
  sex: 'm'
)
