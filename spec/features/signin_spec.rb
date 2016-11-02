require 'spec_helper'

feature 'User Sign In' do

  # let!(:user) do
  #   User.create(email: 'user@example.co.uk', password: 'apple', password_confirmation: 'apple')
  # end

  scenario 'with correct credentials' do

    visit '/sessions/new'
    fill_in :email, with: 'Bill@hotmail.com'
    fill_in :password, with: '123'
    click_button 'Sign in'
    # fill_in :email, with: 'Bill@hotmail.com'
    # fill_in :password, with: '123'
    # click_button 'Sign in'
    expect(page).to have_content "Welcome Bill"
  end

end
