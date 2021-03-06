class BestbuyService

  def initialize
    @_conn = Faraday.new("https://api.bestbuy.com/v1")
  end

  def get_stores(zip)
    response = conn.get("stores(area(#{zip},25))?format=json&show=storeId,storeType,longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV['BESTBUY_API_KEY']}")
    parse(response)
  end

  def get_store(id)
    response = conn.get("stores(storeId=#{id})?format=json&show=hoursAmPm,region,address,storeId,storeType,longName,city,distance,phone,postalCode,storeType&pageSize=15&apiKey=#{ENV['BESTBUY_API_KEY']}")
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
