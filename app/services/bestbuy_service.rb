class BestbuyService

  def initialize
    @_conn = Faraday.new("https://api.bestbuy.com/v1")
  end

  def get_stores(zip)
    conn.get("/stores(postalCode=#{zip})?format=json&show=storeId,storeType,longName,city,distance,phone,storeType&apiKey=#{ENV['BESTBUY_API_KEY']}")
    parse(response)
  end

  private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body)
  end
end