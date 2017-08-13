class SessionsController < ApplicationController
  
  def new
  end

  def create
   if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
          log_in(@user)
          redirect_to root_path, flash:{notice: "login.."}
        else
          redirect_to login_path, flash:{notice: "Invalid password"}  
      end  
    else
     redirect_to login_path, flash:{notice: "Invalid Email"}    
    end
    #redirect_to root_path
  end

  def destroy
    log_out(current_user)
    redirect_to root_path
  end 

end
