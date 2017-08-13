class UsersController < ApplicationController

  before_action :require_login, only: [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in(@user)
      redirect_to root_path
      flash[:success] = "User saved ¡!"
     else
      render "new"
    end
  end  

 private

 def user_params
  params.require(:user).permit(:name, :email, :password,:password_confirmation)
end

def profile
end  

end
