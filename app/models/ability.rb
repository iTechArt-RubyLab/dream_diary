# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Dream, user:
  end
end
