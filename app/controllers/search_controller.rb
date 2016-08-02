class SearchController < ApplicationController

  def index
    @stores = Store.all(params[:q])
  end

end
