require 'spec_helper'

describe 'View Space' do

  before(:each) do
    Space.create(name: 'Beautiful Relaxing Space',
                 description: 'have fun at our BnB',
                 price: "50",
                 available_from: '2017/01/01',
                 available_to: '2017/07/07')
  end

  it "can view property" do
     visit '/spaces'
     click_link 'More'
     expect(page).to_not have_content "Available Properties"
     expect(page).to have_content "Beautiful Relaxing Space"
     expect(page).to have_content "50"
  end
end
