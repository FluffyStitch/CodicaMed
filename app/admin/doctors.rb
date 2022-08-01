# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :phone, :password, :full_name, :category_id, :avatar

  includes :category

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :phone, as: :number
      f.input :password
      f.input :password_confirmation
      f.input :full_name
      f.input :category
      f.input :avatar, as: :file
    end
    f.actions
  end
end
