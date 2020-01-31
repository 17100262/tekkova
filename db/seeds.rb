# frozen_string_literal: true

car_features = ['Front Center Armrests', 'Rear Center Armrests',
                'Multifunctional Steering Wheel', '2 Zone Climate Control',
                'Daytime LED Lights', 'Traction Control', 'Blind Spot Sensor',
                'Parking Sensors', 'Rear View Camera', 'Starter Button',
                'Cruise Control', 'Keyless Start', 'LED headlamps',
                'Sports Mode', 'Cupholders', 'Bike Rack', 'Heated Seats',
                'Sunroof', 'Bluetooth', 'GPS', 'Sun Roof', 'AUX', 'ABS',
                'Booster Seat', 'Pet Friendly', 'USB Input', 'Window Tint',
                'Alarm', 'CarPlay', 'Tow Bar', 'Hill holder',
                'Driver airbag', 'Passenger airbags', 'Central locking',
                'Sport paddles', 'Storage Compartment/Center console',
                'Floor mats', 'Lane departure warning', 'Side airbags',
                'Parking assist', 'Blind Spot Mirrors',
                'Day time LED running lights']

car_features.each do |feature|
  CarFeature.create(name: feature)
end
