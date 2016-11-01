require 'spec_helper'
# - View a list of all available properties
# - Filter through the list of available properties (availability by date - see mockup)
# - Click a link/button which will provide me with more information about the property.

describe 'View Listing' do

  it "can view a list of all available properties" do
    visit('/view')
    expect(page).to have_content "Available Properties"
    expect(page).to have_content "Beautiful Relaxing Space"
    expect(page).to have_content "Description"
  end

end
