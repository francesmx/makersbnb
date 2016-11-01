require 'spec_helper'

feature "user sign-up" do
  scenario "the user registers with a password and password confirmation" do
    visit "/register"
    fill_in :email, with: "batman@hotmail.com"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    click_button "Register"
    expect(page).to have_content "Welcome Batman"
  end
end
