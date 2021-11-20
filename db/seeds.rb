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


bob = Customer.create!(
    email: 'bob@email.com',
    password: 'password',
    first_name: 'bob',
    last_name: 'smith',
    street_address: '1234 Apple Street',
    city: 'Memphis',
    state: 'Tennessee',
    zip_code: '59548'
)

spock = Customer.create!(
    email: 'spock@email.com',
    password: 'password',
    first_name: 'Spock',
    last_name: 'Vulcan',
    street_address: '777 USS Enterprise',
    city: 'Riverside',
    state: 'Vulcan',
    zip_code: '52327'
)

dummy = Worker.create!(
    email: 'dummy@email.com',
    password: 'agfhjr16354',
    first_name: 'dummy',
    last_name: 'dummy',
    street_address: 'dummy',
    city: 'dummy',
    state: 'dummy',
    zip_code: 'dummy',
    specialty: 'dummy', 
    invisibility: 1
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
    specialty: 'Plumber', 
    invisibility: 0

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
    specialty: 'Electrician', 
    invisibility: 0
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
    specialty: 'Electrician', 
    invisibility: 0
)

Frank_Honest = Worker.create!(
    email: 'honest@email.com',
    password: 'password',
    first_name: 'Honest',
    last_name: 'Frank',
    street_address: '123 Boardwalk Lane',
    city: 'Mono',
    state: 'Poly',
    zip_code: '12345',
    specialty: 'Other', 
    invisibility: 0
)

job1 = Job.create!(   
    name: 'Toilet Fix', 
    specialty: 'Plumber',
    description: 'My toilet has not been flushing. It makes a weird noise and does not flush',
    customer: kirk,
    in_progress: false, 
    completed: true,
    worker: builder_bob
)

job2 = Job.create!(   
    name: 'Light', 
    specialty: 'Electrician',
    description: 'My light is shutting off randomly.',
    customer: spock,
    in_progress: false,
    completed: true,
    worker: doe_jane
)

job3 = Job.create!(   
    name: 'Light not working', 
    specialty: 'Electrician',
    description: 'My light fixture is flickering and shutting off randomly.',
    customer: spock,
    in_progress: false,
    completed: true,
    worker: doe_jane
)

rev1 = Review.create!(
    headline: "This is a review",
    body: "the worker was largely awful",
    skill_rating: 3,
    honesty_rating: 1,
    reliability_rating: 1,
    focused_rating: 1,
    pictures: "",
    job: job2
)

rev2 = Review.create!(
    headline: "He was ok",
    body: "the worker was ok",
    skill_rating: 4,
    honesty_rating: 4,
    reliability_rating: 4,
    focused_rating: 4,
    pictures: "",
    job: job1
) 

rev3 = Review.create!(
    headline: "Honest review",
    body: "the worker was largely good",
    skill_rating: 5,
    honesty_rating: 4,
    reliability_rating: 4,
    focused_rating: 3,
    pictures: "",
    job: job3
)