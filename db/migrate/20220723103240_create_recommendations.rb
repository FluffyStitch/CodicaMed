# frozen_string_literal: true

class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.text :text
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
