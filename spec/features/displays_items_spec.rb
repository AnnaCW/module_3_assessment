require "rails_helper"

feature "it displays items" do
  scenario "it reaches the root page" do

    visit "/"

    expect(page.status_code).to eq(200)

    within("h1") do
      expect(page).to have_content("Items"), "page should have an items heading"
    end

  end
end
