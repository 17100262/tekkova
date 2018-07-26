class CreateCarPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :car_pictures do |t|
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
