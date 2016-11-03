require 'spec_helper'

feature 'As a host, so I can manage my bookings, I can accept or reject a booking request.' do



  it 'should display requests from the user' do
    create_user_spaces
    sign_in_host
    create_booking
    visit('/requests')
    expect(page).to have_content('homeless homeless has requested to book Beautiful Relaxing Space')
  end

  it "allows me to accept a request" do
    skip
    request_booking
    click_link('request_1')
    expect(current_path).to eq '/requests/1'
    click_link 'accept_request'
    expect(current_path).to eq '/requests'
    expect(page).to have_content('Booking request has been confirmed')
  end
end
