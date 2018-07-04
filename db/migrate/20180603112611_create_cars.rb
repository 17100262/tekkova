class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :year
      t.string :make
      t.string :model
      t.string :series
      t.string :odometer
      t.string :trans_mission
      t.string :body_type
      t.string :color
      t.string :fuel_type
      t.string :power
      t.integer :number_of_seats
      t.string :drive_type
      t.text :description
      t.string :liecense_plate_number
      t.string :state
      t.string :insurance_provider
      
      
      t.string :availibility_days
      t.string :pickup_suburb
      t.string :pickup_postcode
      t.string :pickup_state
      
      t.string :driving_liecense_country
      t.string :driving_liecense_state
      t.integer :driving_liecense_number
      t.string :driving_liecense_firstname
      t.string :driving_liecense_middlename
      t.string :driving_liecense_lastname
      
      t.integer :personal_house_number
      t.string :personal_street_name
      t.string :personal_suburb
      t.string :personal_state
      t.string :personal_postcode
      t.date :personal_dob
      t.string :personal_mobile
      
      t.references :user
      

      t.timestamps
    end
  end
end
