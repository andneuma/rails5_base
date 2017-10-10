require 'rails_helper'

feature 'Delete registration' do
  scenario 'It can delete active registration' do
    sign_in
    visit edit_user_registration_path
    click_on 'Account'
    page.accept_confirm do
      click_on 'Delete my account'
    end

    expect(User.count).to eq 0
  end
end
