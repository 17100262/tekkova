# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

car_features = ['Front Center Armrests','Rear Center Armrests','Multifunctional Steering Wheel','2 Zone Climate Control','Daytime LED Lights','Traction Control','Blind Spot Sensor','Parking Sensors','Rear View Camera','Starter Button','Cruise Control','Keyless Start',"LED headlamps",'Sports Mode','Cupholders','Bike Rack', 'Heated Seats', 'Sunroof','Bluetooth', 'GPS','Sun Roof','AUX','ABS','Booster Seat','Pet Friendly','USB Input', 'Window Tint', 'Alarm',]
car_features.each do |feature|
    CarFeature.create(name: feature)
end