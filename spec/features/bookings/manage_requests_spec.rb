require 'spec_helper'

feature 'As a host, so I can manage my bookings, I can accept or reject a booking request.' do

  before(:each) do
    request_booking
  end

  it "allows me to accept a request" do
    click_link('request_1')
    expect(current_path).to eq '/requests/1'
    click_link 'accept_request'
    expect(current_path).to eq '/requests'
    expect(page).to have_content('Booking request has been confirmed')
  end
end
