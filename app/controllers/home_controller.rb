# frozen_string_literal: true

class HomeController < ApplicationController
  def welcome
    user = current_user || current_doctor
    redirect_to(edit_registration_path(user)) if user
  end
end
