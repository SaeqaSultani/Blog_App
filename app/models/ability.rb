class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
    elsif user
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
      can :read, :all
      # can :manage, :all
    end
  end
end
