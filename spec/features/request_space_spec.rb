require 'spec_helper'

feature 'request a space' do
  scenario 'As a customer, so I can book accomodation, I can request a space' do
    visit "/spaces/new"
    fill_in :name, with: 'Beautiful Relaxing Space'
    fill_in :description, with: 'have fun at our BnB'
    fill_in :price, with: "50"
    fill_in :available_from, with: '01/01/2017'
    fill_in :available_to, with: '07/07/2017'
    click_button 'List my Space'
    visit '/spaces/1'
    click_button 'Request Booking'
    expect(page).to have_content 'Thank you for booking!'
  end
end
