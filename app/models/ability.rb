class Ability
  include CanCan::Ability

    def initialize(user)
  	    user ||= User.new
	    if user.admin?
            can :manage, :all
        elsif user.moderator?
            can :read, :all
            can :manege, Post do |post|
                post.iser_id = user.id
            end
        elsif user.customer?
            can :read, Product
            can :read, Post            
            can :create, Order
            can :create, Cart
            can :create, LineItem
            can :manage, Order do |order|
                order.user_id = user.id
            end
            can :manage, Cart do |cart|
                cart.user_id = user.id
            end
            can :manege, LineItem do |line_item|
                line_item.user_id = user.id
            end
	   end
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
 
end
