require 'spec_helper'
# - View a list of all available properties
# - Filter through the list of available properties (availability by date - see mockup)
# - Click a link/button which will provide me with more information about the property.

describe 'View Listing' do

  it "can view a list of all available properties" do
    visit('/spaces')
    expect(page).to have_content "Available Properties"
    expect(page).to have_content "Beautiful Relaxing Space"
    expect(page).to have_content "Description"
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
