class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  include Authentication
  before_filter :set_admin

  def set_store
    @store = Store.first
  end

  def set_admin
    if current_user != nil
      @admin = current_user.admin
    end
    logger.info("------------------------ curr user #{current_user.inspect} sesh #{@admin} ------------------------")
  end

  def requires_admin
    if !current_user.admin?
      #flash[:error] = "You do not have access to that page."
      redirect_to root_url
    end
  end

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      begin
        Order.find(session[:order_id])
      rescue
        session[:order_id] = Order.new
      end
    else
      Order.new
    end
  end

end
