require "rails_helper"

describe "Items Endpoint" do
  context "#items" do
    it "gets all items" do
      items = create_list(:item, 3)
      get "/api/v1/items"

      expect(response).to be_success

      parsed = JSON.parse(response.body)

      expect(parsed.length).to eq(3)
      expect(parsed.first['name']).to eq("item1")
    end

  context "item" do
    it "finds one item" do

    end

  end
end
