require "rails_helper"

feature "displays store" do
  scenario "user sees store information" do
    VCR.use_cassette("store-info") do

      visit "/"

      fill_in "Search", with: "80202"
      click_on "Search"

      expect(current_path).to eq("/search")

      click_on("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(current_path).to eq("/stores/:store_id")

      expect(page).to have_content("Long Name: Best Buy Mobile")
      expect(page).to have_content("Store Type: Mobile")
      expect(page).to have_content("Address:")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("8020")
      expect(page).to have_content("Store Hours:")
    end
  end
end


# The name will be a link in the next story:
#
# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
