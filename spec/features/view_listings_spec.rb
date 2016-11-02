require 'spec_helper'

describe 'View Listing' do

  before(:each) do
    Space.create(name: 'Beautiful Relaxing Space',
                 description: 'have fun at our BnB',
                 price: "50",
                 available_from: '2017/01/01',
                 available_to: '2017/07/07')

    Space.create(name: 'New Space',
                 description: 'have fun at our BnB',
                 price: "50",
                 available_from: '2017/01/01',
                 available_to: '2017/07/07')

   Space.create(name: 'Old Space',
                description: 'have fun at our BnB',
                price: "60",
                available_from: '2015/01/01',
                available_to: '2015/07/07')
  end

  it "can view a list of all available properties" do
    visit('/spaces')
    expect(page).to have_content "Available Properties"
    expect(page).to have_content 'Beautiful Relaxing Space'
    expect(page).to have_content 'have fun at our BnB'
    expect(page).to have_content "More"
  end

  it "be able to filter properties by date availability" do
    visit('/spaces')
    expect(page).to have_content "Available from"
    expect(page).to have_content "Available to"
    fill_in :available_from, with: '2017/02/01'
    fill_in :available_to, with: '2017/02/10'
    click_button 'Submit'
    expect(page).to_not have_content "Old Space"
    expect(page).to have_content "New Space"
  end

end
