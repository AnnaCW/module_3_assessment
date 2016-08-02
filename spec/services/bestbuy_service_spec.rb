require "rails_helper"

describe "BestbuyService" do
  it "gets stores" do
    VCR.use_cassette("get-stores") do
      service = BestbuyService.new
      result = service.get_stores("80205")

      expect(result['stores'].count).to eq(15)
    end
  end

  it "gets one store" do
    VCR.use_cassette("get-store") do
      service = BestbuyService.new
      result = service.get_store("2740")

      expect(result['stores'].first['city']).to eq("Denver")
    end
  end
end
