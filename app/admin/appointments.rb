# frozen_string_literal: true

ActiveAdmin.register Appointment do
  actions :index, :show

  includes :doctor, :user
end
