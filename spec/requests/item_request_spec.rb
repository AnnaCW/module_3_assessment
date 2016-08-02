require "rails_helper"

describe "Items Endpoint" do
  context "#items" do
    it "gets all items" do
      items = create_list(:item, 3)
      get "/api/v1/items"

      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body)

      expect(parsed.length).to eq(3)
      expect(parsed.first['name']).to eq("item1")
      expect(parsed.first['description']).to eq("this is an item")
      expect(parsed.first['image_url']).to eq("image_url")
      expect(parsed.first).to_not include("created_at")
      expect(parsed.first).to_not include("updated_at")
    end
  end

  context "#item" do
    it "finds one item" do
      item = create(:item)
      get "/api/v1/items/#{item.id}"

      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body)

      expect(parsed['name']).to eq("item1")
      expect(parsed['description']).to eq("this is an item")
      expect(parsed['image_url']).to eq("image_url")
      expect(parsed['created_at']).to eq(nil)
      expect(parsed['updated_at']).to eq(nil)
    end
  end

  context "#item" do
    it "deletes an item" do
      item = create(:item)
      delete "/api/v1/items/#{item.id}"

      expect(response).to be_success
      expect(response.status).to eq(204)
    end

    it "updates an item" do
      item = create(:item)
      post "/api/v1/items", params: {item: {name: "item2", description: "new item", image_url: "new_url"}}
      expect(response.status).to eq(201)

      parsed = JSON.parse(response.body)

      expect(parsed['name']).to eq("item2")
      expect(parsed['description']).to eq("new item")
      expect(parsed['image_url']).to eq("new_url")
      expect(parsed['created_at']).to eq(nil)
      expect(parsed['updated_at']).to eq(nil)
    end

  end
end
