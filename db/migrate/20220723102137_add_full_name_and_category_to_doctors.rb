# frozen_string_literal: true

class AddFullNameAndCategoryToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :full_name, :string
    add_reference :doctors, :category, null: false, foreign_key: true
  end
end
