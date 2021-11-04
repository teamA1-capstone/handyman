# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kirk = Customer.create!(
    email: 'jkirk@email.com',
    password: 'password',
    first_name: 'James',
    last_name: 'Kirk',
    street_address: '777 USS Enterprise',
    city: 'Riverside',
    state: 'Iowa',
    zip_code: '52327'
)

builder_bob = Worker.create!(
    email: 'builder@email.com',
    password: 'password',
    first_name: 'Bob',
    last_name: 'Builder',
    street_address: '123 Brick Rd',
    city: 'Memphis',
    state: 'TN',
    zip_code: '38002',
    specialty: 'Plumber'
)

hill_jack = Worker.create!(
    email: 'hill@email.com',
    password: 'password',
    first_name: 'Jack',
    last_name: 'Hill',
    street_address: '123 Water Well',
    city: 'Crown',
    state: 'Hill',
    zip_code: '38765',
    specialty: 'Electrician'
)

doe_jane = Worker.create!(
    email: 'jane@email.com',
    password: 'password',
    first_name: 'Jane',
    last_name: 'Doe',
    street_address: '189 Beauty Lane',
    city: 'Grass',
    state: 'Land',
    zip_code: '47638',
    specialty: 'Electrician'
)

job1 = Job.create!(   
    name: 'Toilet Fix', 
    speciality: 'Plumbing',
    description: 'My toilet has not been flushing. It makes a weird noise and does not flush',
    customer: kirk,
    in_progress: false, 
    completed: false
)

job2 = Job.create!(   
    name: 'Light not working', 
    speciality: 'Electrical',
    description: 'My light fixture is flickering and shutting off randomly.',
    customer: bob,
    in_progress: false,
    completed: false
)


