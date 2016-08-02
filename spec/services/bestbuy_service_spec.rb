require "rails_helper"

describe "BestbuyService" do
  it "gets stores" do
    VCR.use_cassette("get-stores") do
      service = BestbuyService.new

      response = service.get_stores("80205")

    
    end
  end
end
