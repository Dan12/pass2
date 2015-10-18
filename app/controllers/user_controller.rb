class UserController < ApplicationController
  
  #important google information:
  #google developer console url: https://console.developers.google.com
  #must enable google+ api for project for authorization to work
  def create_from_callback
    # finds or creates user from oauth variables
    user = User.from_omniauth(env["omniauth.auth"])
    #if user not yet defined, set type to 1
    if user.user_type == nil
      user.user_type = 1
      user.save
    end
    session[:user_id] = user.id
    redirect_to "/"
  end

  #signout action
  def signout
    reset_session
    redirect_to "/"
  end
  
  def view
    @user = User.find_by(id: params[:id])
    if @user
      @visiting_user = current_user
      render "view"
    else
      redirect_to "/"
    end
  end
  
  #change user type
  def change_user_type
    @user = User.find_by(id: params[:user_id])
    @admin = current_user
    if @user
      if @admin.user_type == 3 and @user.user_type != 3
        @user.user_type = params[:change_type].to_i
        @user.save
      end
      redirect_to "/users/view/#{@user.id}"
    else
      redirect_to "/"
    end
  end
end