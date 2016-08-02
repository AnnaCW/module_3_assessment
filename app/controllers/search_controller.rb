class SearchController < ApplicationController

  def index
    Store.all(params[:q])
  end
  
end
