# frozen_string_literal: true

module Devisable
  extend ActiveSupport::Concern

  protected

  def after_sign_in_path_for(resource) = edit_registration_path(resource)

  def after_sign_up_path_for(resource) = edit_registration_path(resource)

  def signed_in_root_path(resource) = edit_registration_path(resource)
end
