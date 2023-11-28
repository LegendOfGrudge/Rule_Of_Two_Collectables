class ApplicationController < ActionController::Base
  before_action :set_brands
  before_action :search_collections
  def set_brands
    @brands = Brand.all
  end
  def search_collections
    @collections = Collection.all
  end
end
