# frozen_string_literal: true

RSpec.configure do |config|
  config.include DeviseRequestHelper, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :feature
end
