require 'spec_helper'

feature 'As a host, so I can manage my bookings, I can accept or reject a booking request.' do

  before(:each) do
    create_user_spaces
    sign_in_host
    create_booking
  end

  it 'should display requests from the user' do
    visit('/requests')
    expect(page).to have_content('homeless homeless has requested to book Beautiful Relaxing Space')
  end

  it "allows me to accept a request" do
    visit '/requests'
    click_link('received_request_1')
    expect(current_path).to eq '/requests/received/1'
    click_link 'accept_request'
    expect(current_path).to eq '/requests'
    expect(page).to have_content('Booking request has been confirmed')
  end
end
