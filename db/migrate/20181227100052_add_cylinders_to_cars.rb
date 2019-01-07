class AddCylindersToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :cylinders, :integer
    add_column :cars, :engine_size, :float
  end
end
