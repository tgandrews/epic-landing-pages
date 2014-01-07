require 'spec_helper'

describe 'account creation' do
  it 'allows user to create an account' do
    visit root_path
    click_link 'Create account'

    fill_in 'Username', with: 'test_user'
    fill_in 'Email', with: 'test_user@gmail.com'
    fill_in 'Password', with: 'complexPassword'
    fill_in 'Password Confirmation', with: 'complexPassword'
    fill_in 'Url', with: 'landingpage.com'

    click_button 'Create account'

    expect(page).to have_content('Signed up successfully')
  end	
end