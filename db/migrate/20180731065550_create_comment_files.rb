class CreateCommentFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_files do |t|
      t.integer :user_id

      t.timestamps
      t.attachment :file
    end
  end
end
