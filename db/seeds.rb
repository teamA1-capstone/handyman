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