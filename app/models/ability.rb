class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
      if user.admin
        can :manage, :all
        can :home, :admin
      else
        can [:update,:destroy,:read,:car_steps], Car do |car|
          p "abilities #{car.user_id} #{user.id} #{car.user_id == user.id}"
          car.user_id == user.id
        end
        can :create, Car
        can :show, User,:id => user.id
        can :update, User,:id => user.id
        can :my_garage, User,:id => user.id
        can :personaldetails,Car
        can :driverdetails,Car
        can :pickupdetails,Car
        can :my_bookings,User
        can :my_documents,User
        can :my_payments,User
        can :my_ratings,User
        can :inbox,User
        can :home, :home
        can :how_it_works,:home
        can :policies,:home
        can :contact_us,:home
        
        # can :index,Car
        # can [:create,:update,:destroy],Car,:user_id => user.id
        # can :show, Car, :user_id => user.id
        # can :read, :all
      end
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
end
