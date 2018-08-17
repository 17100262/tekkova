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
      t.string :agreed_insurance_value
      
      
      
      
      t.integer :daily_drive_limit
      t.boolean :allow_personal_commercial_use
      
      
      
      t.integer :status
      
      t.references :user
      

      t.timestamps
    end
  end
end
