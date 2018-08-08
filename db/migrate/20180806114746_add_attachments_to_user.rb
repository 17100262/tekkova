class AddAttachmentsToUser < ActiveRecord::Migration[5.2]
  def change
    add_attachment :users, :licensefront
    add_attachment :users, :licenseback
  end
end
