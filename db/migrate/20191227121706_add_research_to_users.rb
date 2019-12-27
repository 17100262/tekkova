class AddResearchToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :research, :integer
  end
end
