class AddAttachmentsToCar < ActiveRecord::Migration[5.2]
  def change
    add_attachment :cars, :licensefront
    add_attachment :cars, :licenseback
  end
end
