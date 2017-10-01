FactoryGirl.define do
  factory :settings, class: 'Setting' do
		name 'Some configuration scheme'
    app_title 'Some application'
    relay_email_address 'relay@secret.com'
    activation_tokens_spawned 2
		activation_tokens_required 2
    app_imprint ''
    app_privacy_policy ''
    captcha_system 'recaptcha'
		active true

		trait :no_token_required do
			activation_tokens_required 0
		end
  end
end
