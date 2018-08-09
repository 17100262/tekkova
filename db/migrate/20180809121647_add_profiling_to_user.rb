class AddProfilingToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date
    add_column :users, :address, :text
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
    add_column :users, :license_country, :string
    add_column :users, :license_state, :string
    add_column :users, :license_number, :string
  end
end
