class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Community
    can :read, Event

    # rubocop:disable Style/GuardClause
    if user
      can :create, Community
      can :update, Community
      can :destroy, Community

      can :create, Event
      can :update, Event
      can :destroy, Event

      can :create, Member
      can :destroy, Member

      can :read, Geocoder
    end
  end
end
