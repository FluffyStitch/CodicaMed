# frozen_string_literal: true

class AddDatetimeToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :datetime, :datetime
  end
end
