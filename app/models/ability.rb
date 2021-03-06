class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :subject
      can [:home], StaticPage
      can :update, TaskProgress
      can :create, PermanenceTime
      can [:take, :finish], PreTestActivity
      can [:take, :system_description, :finish], TaskActivity
      can [:retake], TaskActivity do |t|
        t.can_retake_experiment? user
      end
    end
    
  end
end
