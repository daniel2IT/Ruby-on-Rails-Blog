class UsersController < ApplicationController
    
    def new
    end
    


    REGEX_PATTERN = /^(.+)@(.+)$/ 

     
    def create
    user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
    )

    def is_email_valid?(email)
        email =~REGEX_PATTERN
    end
 
      
    

    if user.save

        if is_email_valid?(params[:email])
                flash[:success] = "Succesfully Created User !"
                session[:user_id] = user.id 
                redirect_to '/posts/new' 
            
            else   
                flash[:warning] = "invalid Email"
                redirect_to '/signup'
    
        end
  
    else
        flash[:warning] = "invalid Email or Password"
        redirect_to '/signup'
    end  


end
end
