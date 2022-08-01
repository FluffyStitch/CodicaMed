# frozen_string_literal: true

class Doctor
  class CategoryFilter
    def initialize(params:, scope: Doctor.all)
      @scope = scope
      @params = params
    end

    def call
      (@params[:filter] ? scope.where(category_id: @params[:filter]) : scope).includes(:category)
    end

    private

    attr_reader :scope
  end
end
