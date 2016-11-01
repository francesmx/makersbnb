require 'spec_helper'
# - View a list of all available properties
# - Filter through the list of available properties (availability by date - see mockup)
# - Click a link/button which will provide me with more information about the property.

describe 'View Listing' do

  before(:each) do
    Space.create(name: 'Beautiful Relaxing Space',
                 description: 'have fun at our BnB',
                 price: "50",
                 available_from: '01/01/2017',
                 available_to: '07/07/2017')
  end

  it "can view a list of all available properties" do
    visit('/spaces')
    expect(page).to have_content "Available Properties"
    expect(page).to have_content 'Beautiful Relaxing Space'
    expect(page).to have_content 'have fun at our BnB'
    within('ul li') do
      expect(page).to have_content "More"
    end
  end

  it "be able to filter properties by date availability" do
    visit('/spaces')
    expect(page).to have_content "Available from"
    expect(page).to have_content "Available to"
  end

end
