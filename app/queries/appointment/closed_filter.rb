# frozen_string_literal: true

class Appointment
  class ClosedFilter
    def initialize(params:, scope:)
      @scope = scope
      @params = params
    end

    def call
      (@params[:closed] ? scope.where(closed: @params[:closed]) : scope).order(:closed, datetime: :asc)
    end

    private

    attr_reader :scope
  end
end
