require 'spec_helper'

describe 'user authentication' do
  it 'allows signin with valid credentials' do
    sign_user_in create(:user)
    
    expect(page).to have_content('Signed in successfully')
  end

  it 'does not allow signin with invalid password' do
    sign_user_in create(:user), password: 'wrong pw'

    expect(page).to have_content('Invalid email or password')
  end

  it 'does not allow signin with invalid email' do
    sign_user_in build(:user), email: 'wrongemail@gmail.com'

    expect(page).to have_content('Invalid email or password')
  end

  it 'allows users to sign out' do
    sign_user_in create(:user)

    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully')    
  end

  def sign_user_in(user, opts={})
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: (opts[:email] || user.email)
    fill_in 'Password', with: (opts[:password] || user.password)

    click_button 'Sign in'
  end
end