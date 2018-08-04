class AddPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_attachment :users, :profile_image
    add_column :users, :comment, :text
  end
end
