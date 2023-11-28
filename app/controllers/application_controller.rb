class ApplicationController < ActionController::Base
  before_action :set_brands
  def set_brands
    @brands = Brand.all
  end
end
