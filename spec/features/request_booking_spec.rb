require 'spec_helper'

feature "request booking" do
  scenario 'as a customer I want to request a booking' do
    create_user_spaces
    visit '/spaces'
    find('ul > li:first-child > a').click()
    fill_in :check_in, with: '2017/03/01'
    fill_in :check_out, with: '2017/06/01'
    click_button 'Request Booking'
    expect(current_path).to eq '/spaces/finalise'
    expect(page).to have_content 'Finalise your booking!'
  end

  scenario 'as a customer I want to choose dates and number of people' do
    skip
    create_user_spaces
    visit '/spaces/finalise'
    fill_in :check_in, with: '2017/03/01'
    fill_in :check_out, with: '2017/06/01'
    click_button 'Request Booking'
    expect(page).to have_content 'Thank you! Your request is currently awaiting approval from the host.'
  end

end
