class CreateJoinTableCarCarFeature < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cars, :car_features do |t|
      t.index [:car_id, :car_feature_id]
      # t.index [:car_feature_id, :car_id]
    end
  end
end
