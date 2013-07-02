module ApplicationHelper

	def current_or_guest_user
    	if current_user
      		if session[:guest_user_id]
        		#logging_in login user and destroy guest
        		guest_user.destroy
        		session[:guest_user_id]=nil      
      		end
      		current_user
    	else
    	 	guest_user
   	    end
  	end

  def guest_user
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    rescue ActiveRecord::RecordNotFound
      session[:guest_user]=nil
      guest_user
  end
  
  def create_guest_user
    u = User.create(name: 'guest', email: "guest_#{Time.now.to_i}#{rand(99)}@example.com", role: 'guest')
    u.save!(validate: false)
    session[:guest_user_id] = u.id
    u
  end

   def current_cart
    @current_cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    if current_or_guest_user.nil?
      nil
    else
      @current_cart = current_or_guest_user.carts.create
      session[:cart_id] = @current_cart.id
      @current_cart
    end
  end

end
