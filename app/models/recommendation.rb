# frozen_string_literal: true

class Recommendation < ApplicationRecord
  belongs_to :appointment

  validates :text, presence: true
end
