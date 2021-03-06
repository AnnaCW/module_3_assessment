class Store

  def self.service
    @@service = BestbuyService.new
  end

  def self.all(zip)
    raw_stores = service.get_stores(zip)
    raw_stores["stores"].map do |raw_store|
      OpenStruct.new(raw_store)
    end
  end

  def self.total_stores(zip)
    service.get_stores(zip)["total"]
  end

  def self.find(id)
    raw_store = service.get_store(id)
    OpenStruct.new(raw_store["stores"].first)
  end

end
