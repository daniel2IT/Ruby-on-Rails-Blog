class SessionsController < ApplicationController
    def new
    end
   def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     session[:name] = user.name
     flash[:success] = "Successfully Logged In!"
     redirect_to '/posts/new'
    else
     flash[:warning] = "Invalid Username or Password"
     redirect_to '/login'
    end
   end
    def destroy
     session[:user_id] = nil
     flash[:success] = "You're Logged Out!"
     redirect_to '/login'
    end
   end
