require "rails_helper"

feature "it searches stores by zip" do
  scenario "user sees stores" do
    VCR.use_cassette("zip-search") do

      visit "/"

      fill_in "Search", with: "80202"
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("15 Total Stores")

      within("li:first-child") do
        expec(page).to have_content("Long Name:")
        expec(page).to have_content("City:")
        expec(page).to have_content("Distance:")
        expec(page).to have_content("Phone:")
        expec(page).to have_content("Store Type:")
      end
    end
  end
end


# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
#
# The name will be a link in the next story:
