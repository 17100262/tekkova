class CreateUserDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_documents do |t|
      t.references :user, foreign_key: true
      t.attachment :file

      t.timestamps
    end
  end
end
