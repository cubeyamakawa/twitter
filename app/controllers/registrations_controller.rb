class RegistrationsController < ApplicationController
  def new
  	@user = User.new
    if logged_in?
      redirect_to tweets_url
    end
  end

  def create
  	@user = User.new(params_user)

  	if @user.save
      login(@user.email, @user.password)
  		redirect_to new_sessions_path
  	else
  		render :new
  	end
  end

  	private

  	def params_user
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
