class AddAttachmentAvatarToCarPictures < ActiveRecord::Migration[5.2]
  def self.up
    change_table :car_pictures do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :car_pictures, :avatar
  end
end
