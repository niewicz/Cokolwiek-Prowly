module UserProfile
	UserForm = Dry::Validation.Schema do
		required(:name).filled(:str?)
		required(:surname).filled(:str?, size?: 3..20)
	end
end