require 'spec_helper'

feature "request booking" do
  scenario 'as a customer I want to request a booking' do
    list_booking
    visit '/spaces'
    click_button 'Request'
    expect(current_path).to eq '/spaces/finalise'
    expect(page).to have_content 'Finalise your booking!'
  end

  scenario 'as a customer I want to choose dates and number of people' do
    list_booking
    visit '/spaces/finalise'
    fill_in :check_in, with: '03/01/2017'
    fill_in :check_out, with: '06/01/2017'
    click_button 'Request Booking'
    expect(page).to have_content 'Thank you! Your request is currently awaiting approval from the host.'
  end

end


def list_booking
  visit "/spaces/new"
  fill_in :name, with: 'Beautiful Relaxing Space'
  fill_in :description, with: 'have fun at our BnB'
  fill_in :price, with: "50"
  fill_in :available_from, with: '01/01/2017'
  fill_in :available_to, with: '07/07/2017'
  click_button 'List my Space'
end
