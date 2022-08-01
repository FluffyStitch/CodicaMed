# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:full_name, :phone, :password, :avatar, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:full_name, :phone, :password, :current_password, :avatar, :password_confirmation)
    end
  end

  private

  def current_ability
    @current_ability ||= (resource.is_a?(User) ? UserAbility : DoctorAbility).new(resource)
  end

  def resource = nil
end
