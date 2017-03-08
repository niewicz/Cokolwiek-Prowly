module UserProfile
	ProfileForm = Dry::Validation.Schema do
		required(:city).filled(:str?)
		required(:address).filled(:str?)
		required(:number).filled(:int?, gt?: 0)
	end
end