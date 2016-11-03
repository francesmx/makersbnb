require 'spec_helper'

describe 'View Space' do

  before(:each) do
    create_user_spaces
  end

  it "can view property" do
     visit '/spaces'
     click_link 'More'
     expect(page).to_not have_content "Available Properties"
     expect(page).to have_content "Beautiful Relaxing Space"
     expect(page).to have_content "50"
  end
end
