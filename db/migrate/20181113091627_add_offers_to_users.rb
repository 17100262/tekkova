class AddOffersToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :send_updates, :boolean
    add_column :users, :offers, :boolean,default: false
  end
end
