class WelcomeController < ApplicationController
  def index
  end

  def create
  	service = ::UserProfile::CreateUserWithProfile.new(user_params, profile_params)
  	@errors, @user = service.call

  	if @errors.empty? 
  		redirect_to controller: :welcome, action: :show, id: @user.id
  	else
  		flash[:errors] = @errors
  		render :index
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:name, :surname)
  end

  def profile_params
  	params.require(:profile).permit(:city, :address, :number)
  end
end
