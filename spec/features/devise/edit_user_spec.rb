require 'rails_helper'

feature 'Edit and update user' do
  before do
    sign_in
  end

  scenario 'Can update user with valid credentials' do
    visit edit_user_registration_path
    fill_in 'user_name', with: 'CHANGE'
    click_on 'Update'

    binding.pry
    expect(User.first.reload.name).to eq 'CHANGE'
  end
end
