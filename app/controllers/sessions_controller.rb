class SessionsController < ApplicationController
   def new
   end

   def create
     user = User.find_by(username: params[:session][:username])
     if user.nil?
       flash[:notice] = "No user with that username; please create an account"
       render :new
     elsif user.authenticate(params[:session][:password])
       flash[:notice].clear if flash[:notice]
       session[:user_id] = user.id
       redirect_to user_path(user)
     else
       flash[:notice] = "Incorrect password; please try again."
       render :new
     end
   end

   def destroy
     session.delete(:user_id)
     redirect_to root_path
   end
 end

