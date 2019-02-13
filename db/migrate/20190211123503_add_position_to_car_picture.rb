class AddPositionToCarPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :car_pictures, :position, :integer
  end
end
