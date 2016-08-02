require "rails_helper"

describe "Store" do
  it "returns formatted stores" do
    VCR.use_cassette("stores") do
      result = Store.all("80202")

      expect(result.first.distance).to eq(3.25)
    end
  end

  it "finds store" do
    VCR.use_cassette("store") do
      store = Store.find("2740")

      expect(store.city).to eq("Denver")
    end
  end
end
