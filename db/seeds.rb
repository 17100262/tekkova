# frozen_string_literal: true

car_features = ['Front Centre Armrests', 'Rear Centre Armrests',
                'Multifunctional Steering Wheel', '2 Zone Climate Control',
                'Daytime LED Lights', 'Traction Control', 'Blind Spot Sensor',
                'Parking Sensors', 'Rear View Camera', 'Starter Button',
                'Cruise Control', 'Keyless Start', 'LED headlamps',
                'Sports Mode', 'Cupholders', 'Bike Rack', 'Heated Seats',
                'Sunroof', 'Bluetooth', 'GPS', 'Sun Roof', 'AUX', 'ABS',
                'Booster Seat', 'Pet Friendly', 'USB Input', 'Window Tint',
                'Alarm', 'CarPlay', 'Tow Bar', 'Hill holder',
                'Driver airbag', 'Passenger airbags', 'Central locking',
                'Sport paddles','Floor mats', 'Lane departure warning', 'Side airbags',
                'Parking assist', 'Blind Spot Mirrors',
                'Day time LED running lights', 'Storage Compartment/Center console']

CarFeature.all.destroy_all

car_features.each do |feature|
  CarFeature.create(name: feature)
end

##### AFTER HEROKU PUSH RUN COMMAND : > heroku run rake db:seed --app instashowing