require "rails_helper"

feature "displays store" do
  scenario "user sees store information" do
    VCR.use_cassette("store-info") do

      visit "/"

      fill_in "Search", with: "80202"
      click_on "Search"

      expect(current_path).to eq("/search")

      click_on("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(current_path).to eq("/stores/2740")

      expect(page).to have_content("Store Name: Best Buy Mobile")
      expect(page).to have_content("Store Type: Mobile")
      expect(page).to have_content("Address: 3000 East First Ave")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("80206")
      expect(page).to have_content("Store Hours: Mon: 10am-9pm")
    end
  end
end
