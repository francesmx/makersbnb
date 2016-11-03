require 'spec_helper'

feature "user sign-up" do
  scenario "the user registers with a password and password confirmation" do
    visit "/register"
    fill_in :first_name, with: 'batman'
    fill_in :last_name, with: 'manbat'
    fill_in :email, with: "batman@hotmail.com"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    click_button "Sign-up"
    expect(page).to have_content "Welcome to Makers BnB batman@hotmail.com"
  end


  scenario 'with a password that does not match' do
    visit "/register"
    fill_in :first_name, with: 'catwoman'
    fill_in :last_name, with: 'womancat'
    fill_in :email, with: "catwoman@hotmail.com"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "567"
    click_button "Sign-up"
    expect(current_path).to eq('/register')
    expect(page).to have_content 'Ooops, your password did not match - please try again'
  end
end
