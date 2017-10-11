require 'rails_helper'

feature 'Activation tokens' do
  before do
		create :settings, active: true
		@user = create :user
		@tokens = @user.activation_tokens

		visit new_user_registration_path
    fill_in_registration_form
  end

	scenario 'Can sign up with valid activation tokens' do
		fill_in('activation_token1', with: @tokens[0].token)
		fill_in('activation_token2', with: @tokens[1].token)

    expect { click_sign_up }.to change { User.count }.by(1)
  end

	scenario 'Errors if activation tokens missing' do
    expect { click_sign_up }.to change { User.count }.by(0)
  end

	scenario 'Renders registration template if signup failed' do
  end

	scenario 'Do not need activation tokens if not set' do
    Setting.current_settings.update_attributes(activation_tokens_required: 0)

    expect { click_sign_up }.to change { User.count }.by(1)
  end
end

private

def fill_in_registration_form
  fill_in('user_email', with: 'user@test.como')
  fill_in('user_name', with: 'user')
  fill_in('user_password', with: 'secret')
  fill_in('user_password_confirmation', with: 'secret')
end

def click_sign_up
  find(:xpath, '//input[@value="Sign up"]').click 
end

