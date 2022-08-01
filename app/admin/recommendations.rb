# frozen_string_literal: true

ActiveAdmin.register Recommendation do
  actions :index, :show

  includes :appointment
end
