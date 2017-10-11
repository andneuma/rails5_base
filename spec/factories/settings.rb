FactoryGirl.define do
  factory :settings, class: 'Setting' do
		name 'Some configuration scheme'
    app_title 'Some application'
    relay_email_address 'relay@secret.com'
    user_activation_tokens 2
    app_imprint ''
    app_privacy_policy ''
    captcha_system 'recaptcha'
  end
end
