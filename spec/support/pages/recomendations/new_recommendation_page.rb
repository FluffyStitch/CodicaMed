# frozen_string_literal: true

class NewRecommendationPage < SitePrism::Page
  set_url '/doctors/appointments/{id}/recommendations/new'

  section :form, '#new_recommendation' do
    element :text, '#recommendation_text'

    element :write, '[type="submit"]'
  end
end
