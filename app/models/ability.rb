# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Dream

    return unless user.present?

    can :read, :all
    can :create, Dream
    can [:update, :destroy], Dream, user: user

    return unless user.admin?

    can :manage, :all
  end
end
