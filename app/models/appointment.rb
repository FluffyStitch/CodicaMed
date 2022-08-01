# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  has_one :recommendation, dependent: :destroy

  scope :open, -> { where(closed: false) }
end
