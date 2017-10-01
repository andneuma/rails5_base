FactoryGirl.define do
	factory :activation_token do
		token { SecureRandom.urlsafe_base64(12) }
		redeemed false
		user

		trait :redeemed do
			redeemed true
			redeemed at { (Date.today - 3.days).to_time }
		end
	end
end
