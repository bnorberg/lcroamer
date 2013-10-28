class SessionsController < ApplicationController
  def new
  end  
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to locations_path, :notice => "Signed in!"
  end 
    
 # def create
  #  user = login(params[:email], params[:password], params[:remember])
   # if user
    #  redirect_back_or_to root_url
    #else
     # flash.now.alert = "Username or password was invalid"
      #render :new
    #end
  #end

  #def destroy
   # logout
    #redirect_to root_url, :notice => "Logged out!"
  #end
  
  def destroy
    session[:user_id] = nil
    #render 'https://accounts.google.com/logout'
    redirect_to 'https://accounts.google.com/logout', :notice => "Logged out!"
  end
  
  def failure
    flash.now.alert = "Username or password was invalid"
    render :new
  end  
  
end
