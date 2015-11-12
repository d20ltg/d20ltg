module Authentication

  def self.included(base)
    base.send :helper_method, :current_user, :logged_in?
  end

  def logged_in?
    !!current_user
  end

  def login_required
    login_from_cas
  end

  def login_from_cas

    self.current_user = locate_user
    access_denied unless self.current_user
    self.current_user
  end

  def locate_user
    if session[:user_id]
      user = find_user_by_id(session[:user_id])
    end
  end

  # Override this with how you would like to find users who log in without CAS
  def find_user_by_id(id)
    User.find_by_id(id)
  end
  
  # Override this with how you would like to find users by their username from CAS
  def find_user_by_username(username)
    user = User.find_or_initialize_by(username: session[:user_id])
    user.save!
    user
  end
  
  def access_denied
    #render("Not allowed")
    # NTA flash message access dened
    redirect_to root_url
  end

  # Accesses the current user from the session. 
  # Future calls avoid the database because nil is not equal to false.
  def current_user
   @current_user ||= (locate_user) unless @current_user == false
  end

  # Store the given user id in the session.
  def current_user=(new_user)
    @current_user = new_user || false
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
