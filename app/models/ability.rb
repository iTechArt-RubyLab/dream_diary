# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Dream
    can :read, Category

    return if user.blank?

    can :read, :all
    can :create, Dream
    can :create, Comment
    can(%i[update destroy], Dream, user:)
    can(%i[update destroy], Comment, user:)

    return unless user.admin?

    can :manage, :all
  end
end
