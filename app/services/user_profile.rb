module UserProfile
	class CreateUserWithProfile
		def initialize(user_params, profile_params)
			@user_params = user_params
			profile_params[:number] = profile_params[:number].to_i
			@profile_params = profile_params
		end

		def call
			user_result = UserForm.call(@user_params)
			profile_result = ProfileForm.call(@profile_params)

			if user_result.success? && profile_result.success?
				user = User.new(@user_params)
				profile = Profile.new(@profile_params)
				
				user.save(validate: false)
				profile.save(validate: false)
			end

			construct_errors(user_result, profile_result)
		end

		private
		def construct_errors(user_result, profile_result)
			errors = []

			user_result.messages(full: true).each do |key, array|
				array.each do |error|
					errors << error
				end
			end

			profile_result.messages(full: true).each do |key, array|
				array.each do |error|
					errors << error
				end
			end

			errors
		end
	end
end