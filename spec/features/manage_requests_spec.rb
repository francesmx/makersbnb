require 'spec_helper'

feature 'As a host, so I can manage my bookings, I can accept or reject a booking request.' do

  before(:each) do
    create_spaces
    request_booking
  end

  it "allows me to accept a request" do
    visit '/requests'
    click_link 'requests_1'
    expect(current_path).to eq '/requests/1'
    click_link 'confirm_request'
    expect(current_path).to eq '/requests'
    expect(page).to have_content('Booking request 1 has been confirmed')
  end
end
