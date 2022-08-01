# frozen_string_literal: true

class DeviseCreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :phone,              null: false, index: { unique: true }
      t.string :encrypted_password, null: false, default: ''
      t.datetime :remember_created_at

      t.timestamps null: false
    end
  end
end
