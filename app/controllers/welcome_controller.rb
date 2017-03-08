class WelcomeController < ApplicationController
  def index
  end

  def create
  	service = ::UserProfile::CreateUserWithProfile.new(user_params, profile_params)
  	@errors = service.call

  	if @errors.empty? 
  		head 200
  	else
  		flash[:errors] = @errors
  		render :index
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :surname)
  end

  def profile_params
  	params.require(:profile).permit(:city, :address, :number)
  end
end
