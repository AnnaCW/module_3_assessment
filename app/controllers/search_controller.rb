class SearchController < ApplicationController

  def index
    @stores = Store.all(params[:q])
    @total_stores = Store.total_stores(params[:q])
  end

end
