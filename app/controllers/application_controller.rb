class ApplicationController < ActionController::Base
  before_action :set_brands
  before_action :search_collections

  def set_brands
    @navbar_categories = Brand.all
  end
  def search_collections
    @search_categories = Collection.all
  end
end
