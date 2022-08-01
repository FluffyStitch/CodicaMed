# frozen_string_literal: true

module Users
  class DoctorsController < UsersController
    def index
      doctors = Doctor::CategoryFilter.new(params: permitted_params).call
      @presenter = DoctorsPresenter.new(doctors, permitted_params)
    end

    private

    def permitted_params
      params.permit(:filter)
    end
  end
end
