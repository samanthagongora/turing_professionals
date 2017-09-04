class SessionsController < ApplicationController
   def new
   end

   def create
     user = User.find_by(username: params[:session][:username])
     if user.nil?
       flash[:alert] = "No user with that username; please create an account"
       render :new
     elsif user.authenticate(params[:session][:password])
       flash[:notice].clear if flash[:notice]
       session[:user_id] = user.id
       redirect_to dashboard_path
     else
       flash[:alert] = "Incorrect password; please try again."
       render :new
     end
   end

   def destroy
     session.delete(:user_id)
     flash[:notice] = "Logged out successfully"
     redirect_to root_path
   end
 end
