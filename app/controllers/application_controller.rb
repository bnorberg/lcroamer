class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def zero_authors_or_authenticated
     unless User.count == 0 || current_user
       redirect_to root_path
       return false
     end
   end
end
