class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
     @user.submitted_quiz = params[:user][:submitted_quiz]
 
     if @user.save
       flash[:notice] = "Welcome to the World Capitals Quiz #{@user.name}!"
       create_session(@user)
       redirect_to root_path
     else
       flash.now[:alert] = "Could not create your account. Please try again."
       render :new
     end
   end

end
