require 'spec_helper'

feature 'As a host, so I can manage my bookings, I can accept or reject a booking request.' do

  before(:each) do
    create_user_spaces
    create_booking
    sign_in_host
  end

  it "allows me to accept a request" do
    visit '/requests'
    click_link('homeless homeless has requested to book Beautiful Relaxing Space')
    expect(current_path).to eq '/requests/received/1'
    click_link 'accept_request'
    expect(current_path).to eq '/bookings'
    expect(page).to have_content('homeless homeless is booked in at Beautiful Relaxing Space')
    expect(page).to have_content('Beautiful Relaxing Space')
  end
end
