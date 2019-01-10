# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :firstname
      t.string :lastname
      t.boolean :offers
      t.boolean :admin, default: false
      
      t.string :availibility_days
      t.string :pickup_suburb
      t.string :pickup_postcode
      t.string :pickup_state
      t.string :rental
      t.string :advance_notice
      
      t.string :driving_liecense_country
      t.string :driving_liecense_state
      t.integer :driving_liecense_number
      t.string :driving_liecense_firstname
      t.string :driving_liecense_middlename
      t.string :driving_liecense_lastname
      t.integer :personal_house_number
      t.string :personal_street_name
      t.string :personal_suburb
      t.string :personal_state
      t.string :personal_postcode
      t.date :personal_dob
      t.string :personal_mobile

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_attachment :users, :licensefront
    add_attachment :users, :licenseback
    add_attachment :users, :profile_image
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
