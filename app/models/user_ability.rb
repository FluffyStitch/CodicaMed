# frozen_string_literal: true

class UserAbility
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    can :show, Appointment, user: user
  end
end
