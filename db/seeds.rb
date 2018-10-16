# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

car_features = ['Bike Rack', 'Heated Seats', 'Sunroof','Bluetooth', 'GPS','Sun Roof','Aux','Booster Seat','Pet Friendly','USB Input', 'Window Tint', 'Alarm']
car_features.each do |feature|
    CarFeature.create(name: feature)
end