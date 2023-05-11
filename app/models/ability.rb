# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Dream

    return if user.blank?

    can :read, :all
    can :create, Dream
    can(%i[update destroy], Dream, user:)

    return unless user.admin?

    can :manage, :all
  end
end
