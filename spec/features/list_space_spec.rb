require 'spec_helper'

feature "list spaces" do
  it "As a host, so my space is available for rent, I can list a single space." do
    visit "/spaces/new"
    fill_in :name, with: 'sexy time'
    fill_in :description, with: 'have fun at out BnB'
    fill_in :price, with: "50"
    fill_in :availablity_date_from, with: '1 January 2017'
    fill_in :availablity_date_to, with: '7 January 2017'
    click_button 'List my Space'
    expect(current_path).to eq '/spaces'
    within 'spaces' do
      expect(page).to have_content('sexy time')
    end
  end
end
