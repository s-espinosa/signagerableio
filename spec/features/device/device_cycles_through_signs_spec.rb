require 'rails_helper'

RSpec.describe "When device has a role and multiple signs", :js => true do
  scenario "the device cycles through the signs for that role" do
    skip
    service = TreloraServices.new
    listing = service.house_listing("comingsoon", 2)[1]

    visit '/'

    device = Device.last
    device.update(role: "comingsoon")

    visit '/'

    expect(current_path).to eq(device_path(0))
    wait_for_ajax
    expect(page).to have_content(listing[:ribbon])
    expect(page).to have_content(listing[:title])
    expect(page).to have_content(listing[:subtitle])
    expect(page).to have_xpath "//img[@src=\'#{listing[:best_large_image]}\']"
  end
end