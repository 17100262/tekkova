class CreateCarFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :car_features do |t|
      t.string :name

      t.timestamps
    end
  end
end
