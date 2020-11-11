class UsersController < ApplicationController
    
    def new
    end
    
    def create
    user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
    )

    if user.save
        session[:user_id] = user.id
        flash[:success] = "Succesfully Created User !"

        redirect_to '/posts/new'
    else
        flash[:warning] = "invalid Email or Password"
        redirect_to '/signup'
    end  
  end
end
