# frozen_string_literal: true

class AddAvatarDataToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :avatar_data, :jsonb
  end
end
